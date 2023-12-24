import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionDeviceState> {
  ConnectionBloc() : super(ConnectionInitial()) {
    on<ConnectionEvent>((event, emit) async {
      try {
        if (event is CheckConnection) {
          emit(ConnectionLoading(isCheckComplete: false));
          final connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult == ConnectivityResult.mobile) {
            //isConnected = true;
            print('isConnected');
            //notifyListeners();
            emit(ConnectionSuccess(r: connectivityResult.name));
          } else if (connectivityResult == ConnectivityResult.wifi) {
            //isConnected = true;
            print('isConnected');
            //notifyListeners();
            emit(ConnectionSuccess(r: connectivityResult.name));
          } else {
            // isConnected = false;
            print('Not connected');
            //notifyListeners();
            emit(ConnectionLoading(isCheckComplete: true));
          }
        }
      } catch (e) {
        emit(ConnectionFailure(errorMessage: e.toString()));
      }
    });
  }
}
