part of 'authentication_bloc_bloc.dart';

@immutable
abstract class AuthenticationBlocEvent {
  const AuthenticationBlocEvent();

  List<Object> get props => [];
}

class SignInUser extends AuthenticationBlocEvent {
  final String username;
  final String password;
  final BuildContext context;

  SignInUser(
      {required this.context, required this.username, required this.password}) {
    print(' Password : $password , Email : $username');
  }

  @override
  List<Object> get props => [username, password];
}

class SignUpUser extends AuthenticationBlocEvent {
  final String username;
  final String password;

  SignUpUser({required this.username, required this.password}) {
    print(' Password : $password , Email : $username');
  }

  @override
  List<Object> get props => [username, password];
}

class SignOut extends AuthenticationBlocEvent {
  final BuildContext context;

  const SignOut({required this.context});
}

class TriggerGetUserEvent extends AuthenticationBlocEvent {}
