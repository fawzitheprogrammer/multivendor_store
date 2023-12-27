part of 'google_auth_bloc.dart';

@immutable
sealed class GoogleAuthEvent {}

class SignInUsingGmail extends GoogleAuthEvent {
  BuildContext ctx;

  SignInUsingGmail({required this.ctx});
}

class GetUsers extends GoogleAuthEvent {}

class SignOutUser extends GoogleAuthEvent {
  final BuildContext ctx;

  SignOutUser({required this.ctx});
}
