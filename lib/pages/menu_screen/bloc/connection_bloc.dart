import 'package:star_wars_excercise/pages/char_details/bloc/report_char_event.dart';
import 'package:star_wars_excercise/api/api.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/report_char_state.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_event.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_state.dart';

import '../../../models/report.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, AppConnectionState> {
  ConnectionBloc() : super(const AppConnectionState()) {
    on<TurnOn>(_turnOn);
    on<TurnOff>(_turnOff);
  }

  Future<void> _turnOn(
    TurnOn event,
    Emitter<AppConnectionState> emit,
  ) async {
    return emit(state.copyWith(connection: true));
  }

  Future<void> _turnOff(
    TurnOff event,
    Emitter<AppConnectionState> emit,
  ) async {
    return emit(state.copyWith(connection: false));
  }
}
