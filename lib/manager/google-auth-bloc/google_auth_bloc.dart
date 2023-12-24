import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multivendor_store/core/errors/failures.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/firebase/collections.dart';
import 'package:multivendor_store/core/firebase_package_helper.dart';

import '../../core/utils/app_route.dart';

part 'google_auth_event.dart';
part 'google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  GoogleAuthBloc() : super(GoogleAuthInitial()) {
    on<GoogleAuthEvent>((event, emit) async {
      if (event is SignInUsingGmail) {
        try {
          emit(GoogleAuthLoading());
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          if (googleUser != null) {
            final GoogleSignInAuthentication googleSignInAuthentication =
                await googleUser.authentication;

            final OAuthCredential authCredential =
                GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken,
            );

            UserCredential userCredential =
                await firebaseAuth.signInWithCredential(authCredential);

            var user = await firebaseFirestore
                .collection(FirebaseCollection.stores)
                .doc(userCredential.user!.uid)
                .get();

            if (user.exists &&
                sharedPreferences!.get('route') != AppRoute.kRegistrationView) {
              sharedPreferences!.setString('route', AppRoute.kHome);
              GoRouter.of(event.ctx).push(AppRoute.kHome);
            } else {
              await firebaseFirestore
                  .collection(FirebaseCollection.stores)
                  .doc(userCredential.user!.uid)
                  .set({
                'userEmail': userCredential.user!.email,
                'fullName': userCredential.user!.displayName,
              }).then((value) {
                sharedPreferences!
                    .setString('route', AppRoute.kRegistrationView);
                GoRouter.of(event.ctx).push(AppRoute.kRegistrationView);
                emit(GoogleAuthSuccess());
              });
            }
          }
        } on PlatformException catch (e) {
          emit(
            GoogleAuthFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } on FirebaseException catch (e) {
          emit(
            GoogleAuthFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        }
      }

      if (event is GetUsers) {
        try {
          emit(GoogleAuthLoading());
          final user = firebaseAuth.currentUser;
          emit(GetGoogleUser(user: user));
        } on FirebaseException catch (e) {
          emit(
            GoogleAuthFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } on PlatformException catch (e) {
          emit(
            GoogleAuthFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        }
      }

      if (event is SignOutUser) {
        try {
          emit(GoogleAuthLoading());
          final GoogleSignIn googleSignIn = GoogleSignIn();
          final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

          // Sign out from Firebase
          await firebaseAuth.signOut();

          // Disconnect the Google Sign-In account
          await googleSignIn.disconnect().whenComplete(() {
            sharedPreferences!.setString('route', AppRoute.kLoginView);
            GoRouter.of(event.ctx).push(AppRoute.kLoginView);
          });
        } on FirebaseException catch (e) {
          emit(
            GoogleAuthFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        } on PlatformException catch (e) {
          emit(
            GoogleAuthFailure(
                errorMessage: ServerFailure.fromStatusCode(e).errorMessage),
          );
        }
      }
    });
  }
}
