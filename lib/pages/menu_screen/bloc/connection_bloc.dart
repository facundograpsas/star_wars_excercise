import 'package:star_wars_excercise/pages/char_details/bloc/report_char_event.dart';
import 'package:star_wars_excercise/api/api.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/report_char_state.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_event.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_state.dart';
import 'package:star_wars_excercise/repository/sw_repository.dart';

import '../../../models/report.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, AppConnectionState> {
  ConnectionBloc({required this.repository})
      : super(const AppConnectionState()) {
    on<TurnOn>(_turnOn);
    on<TurnOff>(_turnOff);
    on<TurnInit>(_loadState);
  }

  final SW_repositoryImpl repository;

  Future<void> _loadState(
    TurnInit event,
    Emitter<AppConnectionState> emit,
  ) async {
    return emit(state.copyWith(connection: await repository.isConnected()));
  }

  Future<void> _turnOn(
    TurnOn event,
    Emitter<AppConnectionState> emit,
  ) async {
    repository.setConnection(true);
    return emit(state.copyWith(connection: await repository.isConnected()));
  }

  Future<void> _turnOff(
    TurnOff event,
    Emitter<AppConnectionState> emit,
  ) async {
    repository.setConnection(false);
    return emit(state.copyWith(connection: await repository.isConnected()));
  }
}
