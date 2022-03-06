import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../model/bored.dart';
import '../services/connectivityService.dart';

part 'bored_event.dart';
part 'bored_state.dart';

class BoredBloc extends Bloc<BoredEvent, BoredState> {
  final BoredService _boredService;
  final ConnectivityService _connectivityService;

  BoredBloc(this._boredService, this._connectivityService)
      : super(HomeLoadingState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('no internet');
        add(NoInternetEvent());
      } else {
        print('yes internet');
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      final activity = await _boredService.getBoredActivity();
      emit(HomeLoadedState(
          activity.activity, activity.type, activity.participants));
    });

    on<NoInternetEvent>((event, emit) {
      emit(HomeNoInternetState());
    });
  }
}
