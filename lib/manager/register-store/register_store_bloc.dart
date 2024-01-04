import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multivendor_store/core/errors/failures.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/firebase/collections.dart';
import 'package:multivendor_store/core/firebase/get_device_token.dart';
import 'package:multivendor_store/core/firebase/logged_user.dart';
import 'package:multivendor_store/core/firebase_package_helper.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/features/user-profile/data/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage_helper;
part 'register_store_event.dart';
part 'register_store_state.dart';

final collection = FirebaseCollection.stores;

class RegisterStoreBloc extends Bloc<RegisterStoreEvent, RegisterStoreState> {
  RegisterStoreBloc() : super(RegisterStoreInitial()) {
    on<RegisterStoreEvent>((event, emit) async {
      if (event is RegisterStore) {
        try {
          emit(RegisterStoreLoading(isLoading: true));

          String? profilePic = await getImageUrl(event.profilePic);
          String? idFrontSide = await getImageUrl(event.idFrontSide);
          String? idBackSide = await getImageUrl(event.idBackSide);
          String? businessLicense =
              await getImageUrl(event.businessLicenseSide);

          await NotificationService.requestPermission();
          String? deviceToken = await NotificationService.getDeviceToken();

          final store = event.storeModel;

          // Storing data into firebase
          await firebaseFirestore
              .collection(collection)
              .doc(firebaseUser.toString())
              .update(StoreModel(
                userId: firebaseUser.toString(),
                fullNameOnId: store.fullNameOnId,
                profilePicture: profilePic,
                businessName: store.businessName,
                shopType: store.shopType,
                phoneNumber: store.phoneNumber,
                location: store.location,
                idFrontSide: idFrontSide,
                idBackSide: idBackSide,
                businessLicenseId: businessLicense,
                isApproved: false,
                deviceToken: deviceToken,
                isRegistered: true,
              ).toJson())
              .then((val) {
            
            sharedPreferences!.setString('route', AppRoute.kHome);
            GoRouter.of(event.context).pushReplacement(AppRoute.kHome);
            emit(
              RegisterStoreSuccess(),
            );
          });
        } on PlatformException catch (e) {
          emit(
            RegisterStoreFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } on FirebaseException catch (e) {
          emit(
            RegisterStoreFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } catch (e) {
          emit(RegisterStoreFailure(errorMessage: 'Unexpeted error occured'));
        }
      }
    });
  }

  Future<String?> getImageUrl(XFile incomingFile) async {
    File file = File(incomingFile.path);

    // Uploading selected image to the firebase storge
    String fileName =
        '${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}';

    storage_helper.UploadTask storageReference =
        firebaseStorage.ref().child('$collection/$fileName').putFile(file);
    TaskSnapshot snapshot = await storageReference;

    // Getting the uploaded image download link to store it in the firebase
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
