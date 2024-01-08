import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/errors/failures.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/firebase/collections.dart';
import 'package:multivendor_store/core/firebase/logged_user.dart';
import 'package:multivendor_store/core/firebase_package_helper.dart';
import 'package:multivendor_store/features/store-profile/data/models/product_model.dart';
import 'package:multivendor_store/manager/register-store/register_store_bloc.dart';
import 'package:uuid/uuid.dart';
part 'store_product_event.dart';
part 'store_product_state.dart';

class StoreProductBloc extends Bloc<StoreProductEvent, StoreProductState> {
  StoreProductBloc() : super(StoreProductInitial()) {
    on<StoreProductEvent>((event, emit) async {
      // --------------------------- Start Create event -------------------------
      if (event is CreateProduct) {
        try {
          emit(StoreProductLoading());

          /// Uploading selected image to the firebase storge
          final String fileName = const Uuid().v7();

          List<String> imagesLink = await uploadAllImages(event.file, fileName);

          // Storing data into firebase
          await firebaseFirestore
              .collection(collection)
              .doc(firebaseUser!.toString())
              .collection(FirebaseCollection.storeProductCollection)
              .doc(fileName)
              .set(
                Product(
                  productId: fileName,
                  productName: event.product.productName,
                  productCategory: event.product.productCategory,
                  productImages: imagesLink,
                  productPrice: event.product.productPrice,
                  productQuantity: event.product.productQuantity,
                  productShortDescription:
                      event.product.productShortDescription,
                  offerPrice: event.product.offerPrice,
                  rating: event.product.rating,
                  brandName: event.product.brandName,
                  vendorName: event.product.vendorName,
                  tags: event.product.tags,
                  clothingSize: event.product.clothingSize,
                  shoeSize: event.product.shoeSize,
                  productSubCategory: event.product.productSubCategory,
                ).toJson(),
              )
              .whenComplete(() {
            // When category is stored into database, it should return to main screen of category table
            if (GoRouter.of(event.context).canPop()) {
              GoRouter.of(event.context).pop();
            }
          });
          emit(StoreProductSuccess());
        } on PlatformException catch (e) {
          emit(
            StoreProductFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } on FirebaseException catch (e) {
          emit(
            StoreProductFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        }
      }
      // --------------------------- End Create event -------------------------
      // --------------------------- Start Update event -------------------------
      if (event is UpdateProduct) {
        try {
          emit(StoreProductLoading());

          /// Uploading selected image to the firebase storge
          final String fileName = const Uuid().v7();

          /// Uploading selected image to the firebase storge
          List<String> imagesLink = [];

          if (event.file != null) {
            imagesLink = await uploadAllImages(event.file ?? [], fileName);
            debugPrint('INSIDE IF : ${imagesLink.toString()}');
          }

          Map<String, dynamic> product = Product(
            productId: event.productID,
            productName: event.product.productName,
            productCategory: event.product.productCategory,
            productImages: imagesLink.isNotEmpty
                ? imagesLink
                : event.product.productImages,
            productPrice: event.product.productPrice,
            productQuantity: event.product.productQuantity,
            productShortDescription: event.product.productShortDescription,
            offerPrice: event.product.offerPrice,
            rating: event.product.rating,
            brandName: event.product.brandName,
            vendorName: event.product.vendorName,
            tags: event.product.tags,
            clothingSize: event.product.clothingSize,
            shoeSize: event.product.shoeSize,
            productSubCategory: event.product.productSubCategory,
          ).toJson();

          // Storing data into firebase
          await firebaseFirestore
              .collection(collection)
              .doc(firebaseUser!.toString())
              .collection(FirebaseCollection.storeProductCollection)
              .doc(event.productID)
              .update(product)
              .whenComplete(() {
            // When category is stored into database, it should return to main screen of category table
            if (GoRouter.of(event.context).canPop()) {
              GoRouter.of(event.context).pop();
            }
          });
          emit(StoreProductSuccess());
        } on PlatformException catch (e) {
          emit(
            StoreProductFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } on FirebaseException catch (e) {
          emit(
            StoreProductFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        }
      }
      // --------------------------- End Update event -------------------------

      if (event is GetSingleProduct) {
        emit(StoreProductLoading());
        emit(
          SingleProductState(product: event.product),
        );
      }

      if (event is DeleteProduct) {
        try {
          emit(StoreProductLoading());
          await firebaseFirestore
              .collection(FirebaseCollection.stores)
              .doc(firebaseUser!.toString())
              .collection(FirebaseCollection.storeProductCollection)
              .doc(event.productID)
              .delete();
          emit(StoreProductSuccess());

          // Deleting attached picture from the firebase storage
          await firebaseStorage
              .ref()
              .child(
                  '${FirebaseCollection.stores}/${FirebaseCollection.storeProductCollection}/${event.productID}/')
              .delete();
        } on PlatformException catch (e) {
          emit(
            StoreProductFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } on FirebaseException catch (e) {
          emit(
            StoreProductFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        }
      }
    });
  }

  Future<List<String>> uploadAllImages(List<File> images, String folder) async {
    List<String> allImagesLink = [];
    final firebaseStorage = FirebaseStorage.instance;

    for (int i = 0; i < images.length; i++) {
      try {
        String fileExtension = images[i].path.split('.').last;
        String fileName =
            '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

        UploadTask storageReference = firebaseStorage
            .ref()
            .child(
                '${FirebaseCollection.stores}/${FirebaseCollection.storeProductCollection}/$folder/$fileName')
            .putFile(images[i]);

        TaskSnapshot snapshot = await storageReference;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        allImagesLink.add(downloadUrl);
      } catch (e) {
        print('Error uploading image: $e');
        // Handle the error or add to a list of failed uploads
      }
    }

    return allImagesLink;
  }
}
