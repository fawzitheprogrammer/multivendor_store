part of 'google_auth_bloc.dart';

@immutable
sealed class GoogleAuthState {}

final class GoogleAuthInitial extends GoogleAuthState {}

final class GoogleAuthLoading extends GoogleAuthState {}

final class GoogleAuthSuccess extends GoogleAuthState {}

final class GoogleAuthFailure extends GoogleAuthState {
  final String errorMessage;

  GoogleAuthFailure({
    required this.errorMessage,
});
}

final class GetGoogleUser extends GoogleAuthState {
  final User? user;

  GetGoogleUser({required this.user});
}
