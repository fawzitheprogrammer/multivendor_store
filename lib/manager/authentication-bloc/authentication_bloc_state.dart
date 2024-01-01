part of 'authentication_bloc_bloc.dart';

@immutable
abstract class AuthenticationBlocState {
  const AuthenticationBlocState();

  List<Object> get props => [];
}

final class AuthenticationBlocInitial extends AuthenticationBlocState {}

final class AuthenticationBlocLoading extends AuthenticationBlocState {
  final bool isCheckComplete;

  const AuthenticationBlocLoading({required this.isCheckComplete});
}

final class AuthenticationBlocSuccess extends AuthenticationBlocState {
  final bool userIsTaken;

  const AuthenticationBlocSuccess({required this.userIsTaken});

  @override
  List<Object> get props => [userIsTaken];
}

final class AuthenticationBlocFailure extends AuthenticationBlocState {
  final String errorMessage;

  const AuthenticationBlocFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class GetLoggedInUser extends AuthenticationBlocState {
  final StoreModel storeModel;

  const GetLoggedInUser({required this.storeModel});
}
