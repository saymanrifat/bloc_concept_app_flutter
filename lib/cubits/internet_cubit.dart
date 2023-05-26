import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetState> {


  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitSubscription;
  InternetCubit() : super(InternetState.Initial) {
    connectivitSubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.Gained);
      } else {
        emit(InternetState.Lost);
      }
    });
  }


  @override
  Future<void> close() {
    connectivitSubscription?.cancel();
    return super.close();
  }


}
