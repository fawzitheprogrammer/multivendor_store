import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errormessage);

  factory ServerFailure.fromStatusCode(Exception exception) {
    if (exception is FirebaseException) {
      switch (exception.code) {
        case 'invalid-email':
          return ServerFailure('Invalid email address');
        case 'wrong-password':
          return ServerFailure('Wrong password');
        case 'user-not-found':
          return ServerFailure('User not found');
        case 'user-disabled':
          return ServerFailure('User account has been disabled');
        case 'too-many-requests':
          return ServerFailure('Too many requests, try again later');
        case 'network-request-failed':
          return ServerFailure('Network error, check your internet connection');
        // Firestore-specific error codes
        case 'cancelled':
          return ServerFailure('Operation cancelled');
        case 'unknown':
          return ServerFailure('Unknown error occurred');
        case 'invalid-argument':
          return ServerFailure('Invalid argument provided');
        case 'deadline-exceeded':
          return ServerFailure('Deadline exceeded, operation took too long');
        case 'not-found':
          return ServerFailure('Requested document not found');
        case 'already-exists':
          return ServerFailure('Document already exists');
        case 'permission-denied':
          return ServerFailure('Permission denied');
        case 'resource-exhausted':
          return ServerFailure('Resource exhausted, try again later');
        case 'failed-precondition':
          return ServerFailure('Failed precondition, operation rejected');
        case 'aborted':
          return ServerFailure('Operation aborted due to a concurrency issue');
        case 'out-of-range':
          return ServerFailure('Operation out of range');
        case 'unimplemented':
          return ServerFailure('Operation not implemented');
        case 'internal':
          return ServerFailure('Internal error');
        case 'unavailable':
          return ServerFailure('Service currently unavailable');
        case 'data-loss':
          return ServerFailure('Data loss or corruption');
        case 'unauthenticated':
          return ServerFailure('Unauthenticated request');

        default:
          return ServerFailure('An unexpected error occurred');
      }
    } else if (exception is PlatformException) {
      switch (exception.code) {
        case 'network_error':
          return ServerFailure('Network error, check your internet connection');
        case 'sign_in_canceled':
          return ServerFailure('Sign-in process was cancelled');
        // Add more Platform-specific cases as needed
        default:
          return ServerFailure('An unexpected platform error occurred');
      }
    } else {
      return ServerFailure('An unknown error occurred');
    }
  }
}
