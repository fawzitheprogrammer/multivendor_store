import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:multivendor_store/core/check_if_user_is_connected.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionDeviceState> {
  ConnectionBloc() : super(ConnectionInitial()) {
    on<ConnectionEvent>((event, emit) async {
      try {
        if (event is CheckConnection) {
          emit(ConnectionLoading(isCheckComplete: false));
          await checkInternetAccess().then((value) {
            if (value == true) {
              emit(ConnectionSuccess(r: value.toString()));
            } else {
              emit(ConnectionLoading(isCheckComplete: true));
            }
          });
        }
      } catch (e) {
        emit(ConnectionFailure(errorMessage: e.toString()));
      }
    });
  }

}
