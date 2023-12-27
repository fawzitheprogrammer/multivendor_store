part of 'connection_bloc.dart';

@immutable
sealed class ConnectionDeviceState {}

class ConnectionInitial extends ConnectionDeviceState {}

class ConnectionLoading extends ConnectionDeviceState {
  final bool isCheckComplete;

  ConnectionLoading({required this.isCheckComplete}) {
    print(isCheckComplete);
  }
}

class ConnectionSuccess extends ConnectionDeviceState {
  final String r;

  ConnectionSuccess({required this.r}) {
    debugPrint(r);
  }
}

class ConnectionFailure extends ConnectionDeviceState {
  final String errorMessage;

  ConnectionFailure({required this.errorMessage});
}
