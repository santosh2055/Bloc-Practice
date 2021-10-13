import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_3/Constants/enum.dart';
import 'package:bloc_3/Logic/Cubit/internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;
  InternetCubit(@required this.connectivity)
      : super(InternetLoding()) {
    moniterInternetConnection();
  }

  StreamSubscription<ConnectivityResult> moniterInternetConnection() {
    return connectivityStreamSubscription =
      Connectivity().onConnectivityChanged.listen((connectivityResut) {
    if (connectivityResut == ConnectivityResult.wifi) {
      emitInternetConneted(ConntectionType.wifi);
    } else if (connectivityResut == ConnectivityResult.mobile) {
      emitInternetConneted(ConntectionType.mobile);
    } else if (connectivityResut == ConnectivityResult.none) {
      emitDisconneted();
    }
  });
  }

  void emitInternetConneted(ConntectionType _connectionType) =>
      emit(InternetConnected(conntectionType: _connectionType));

  void emitDisconneted() => emit(InternetDisconected());
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
