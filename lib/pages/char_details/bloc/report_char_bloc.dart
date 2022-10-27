import 'package:star_wars_excercise/pages/char_details/bloc/report_char_event.dart';
import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/models/starship.dart';
import 'package:star_wars_excercise/models/vehicle.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_event.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_state.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/report_char_state.dart';
import 'package:star_wars_excercise/repository/sw_repository.dart';

import '../../../models/report.dart';

class ReportCharBloc extends Bloc<ReportCharEvent, ReportCharState> {
  ReportCharBloc({required this.repository}) : super(const ReportCharState()) {
    on<ReportChar>(_postReport);
  }

  final SW_repositoryImpl repository;

  Future<void> _postReport(
    ReportChar event,
    Emitter<ReportCharState> emit,
  ) async {
    emit(state.copyWith(status: ReportCharStatus.loading));
    if (await repository.isConnected()) {
      var response = await repository.createReport(Report(
          userId: 1,
          characterName: event.character.name!,
          dateTime: DateTime.now().toString()));
      response.fold(
          (failure) => emit(state.copyWith(
              status: ReportCharStatus.failure, message: failure.message)),
          (report) => emit(state.copyWith(status: ReportCharStatus.success)));
    } else {
      emit(state.copyWith(
          status: ReportCharStatus.failure,
          message:
              'Activa la conexión en el menu para reportar un avistamiento enemigo'));
    }
  }
}
