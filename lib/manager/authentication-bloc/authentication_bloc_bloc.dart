import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multivendor_store/core/constants.dart';
import 'package:multivendor_store/core/errors/failures.dart';
import 'package:multivendor_store/core/firebase/collections.dart';
import 'package:multivendor_store/core/firebase/logged_user.dart';
import 'package:multivendor_store/core/firebase_package_helper.dart';
import 'package:multivendor_store/core/utils/app_route.dart';
import 'package:multivendor_store/features/user-profile/data/models/user_model.dart';

part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

class AuthenticationBlocBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  //AuthService authService = AuthService();

  AuthenticationBlocBloc() : super(AuthenticationBlocInitial()) {
    // Start of Authentication Event
    on<AuthenticationBlocEvent>((event, emit) async {
      // If the event is [SignUpUser] the below code will be executed
      if (event is SignInUser) {
        try {
          emit(const AuthenticationBlocLoading(isCheckComplete: false));

          // Get user data in the firebase
          // Check if the username already exists in Firestore
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
              .collection(FirebaseCollection.stores)
              .doc(event.username)
              .get();

          await checkIfUsernameTaken(event.username).then((value) {
            if (value == true) {
              sharedPreferences!.setString('firebaseUser', event.username);
              if (userSnapshot.get('isRegistered') == true) {
                GoRouter.of(event.context).push(AppRoute.kHome);
              } else {
                GoRouter.of(event.context).push(AppRoute.kRegistrationView);
              }
            }
          });

          emit(const AuthenticationBlocLoading(isCheckComplete: true));

          // In case of any Firebase Exception
        } on FirebaseException catch (e) {
          emit(
            AuthenticationBlocFailure(
              errorMessage: ServerFailure.fromStatusCode(e).errorMessage,
            ),
          );
        }
      }
      // If the event is [SignUpUser] the below code will be executed
      if (event is SignUpUser) {
        try {
          await checkIfUsernameTaken(event.username).then((value) async {
            if (value == true) {
              emit(AuthenticationBlocSuccess(userIsTaken: value));
            } else {
              // Awaiting for the signing in the user with email and password
              await firebaseFirestore
                  .collection(FirebaseCollection.stores)
                  .doc(event.username)
                  .set(
                      {'username': event.username, 'password': event.password});
            }
          });

          // In case of any Firebase Exception
        } on FirebaseException catch (e) {
          emit(
            AuthenticationBlocFailure(
              errorMessage: ServerFailure.fromStatusCode(e).errorMessage,
            ),
          );
        }
      }
      // if the event is [SignOut] the below code will be executed
      if (event is SignOut) {
        emit(const AuthenticationBlocLoading(isCheckComplete: true));

        try {
          if (firebaseUser != null) {
            await firebaseAuth.signOut().then((value) {
              GoRouter.of(event.context).pushReplacement(AppRoute.kLoginView);
            });
          }
        } on FirebaseException catch (e) {
          emit(
            AuthenticationBlocFailure(
              errorMessage: ServerFailure.fromStatusCode(e).errorMessage,
            ),
          );
        }
        emit(const AuthenticationBlocLoading(isCheckComplete: false));
      }

      if (event is TriggerGetUserEvent) {
        emit(const AuthenticationBlocLoading(isCheckComplete: true));
        // Get user data in the firebase
        // Check if the username already exists in Firestore
        var userSnapshot = await firebaseFirestore
            .collection(FirebaseCollection.stores)
            .doc(firebaseUser.toString())
            .get();

        emit(
          GetLoggedInUser(
            storeModel: StoreModel(
              fullNameOnId: userSnapshot.get('fullNameOnId'),
              userId: userSnapshot.get('userId'),
              profilePicture: userSnapshot.get('profilePicture'),
            ),
          ),
        );
        //emit(const AuthenticationBlocLoading(isCheckComplete: false));
      }
    });
  }

  Future<bool> checkIfUsernameTaken(String username) async {
    try {
      // Check if the username already exists in Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollection.stores)
          .doc(username)
          .get();
      return userSnapshot.exists;
    } catch (e) {
      print('Error checking username availability: $e');
      return true; // Assume username is taken in case of an error
    }
  }
}
