part of 'register_store_bloc.dart';

@immutable
sealed class RegisterStoreState {}

final class RegisterStoreInitial extends RegisterStoreState {}

final class RegisterStoreLoading extends RegisterStoreState {
  final bool isLoading;

  RegisterStoreLoading({required this.isLoading});
}

final class RegisterStoreSuccess extends RegisterStoreState {}

final class RegisterStoreFailure extends RegisterStoreState {
  final String errorMessage;

  RegisterStoreFailure({required this.errorMessage}) {
    print('==================== $errorMessage ==================');
  }
}
