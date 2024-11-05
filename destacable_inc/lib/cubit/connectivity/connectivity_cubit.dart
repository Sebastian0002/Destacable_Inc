import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());
  StreamSubscription<List<ConnectivityResult>>? subscription;

  void getConnectionStatus(){
    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      emit(ConnectivityConnectionRequest(isConnected: !result.contains(ConnectivityResult.none)));
    });
  }

  void cancelSubscription(){
    subscription?.cancel();
  }

}
