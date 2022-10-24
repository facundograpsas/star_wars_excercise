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

import '../../../models/report.dart';

class ReportCharBloc extends Bloc<ReportCharEvent, ReportCharState> {
  ReportCharBloc({required this.api}) : super(const ReportCharState()) {
    on<ReportChar>(_postReport);
  }

  final RestClient api;

  Future<void> _postReport(
    ReportChar event,
    Emitter<ReportCharState> emit,
  ) async {
    emit(state.copyWith(status: ReportCharStatus.loading));
    try {
      var response = await api.createReport(Report(
          userId: 1, characterName: event.character.name!, dateTime: '12'));
      await Future.delayed(Duration(seconds: 1));
      return emit(state.copyWith(status: ReportCharStatus.success));
    } on Exception catch (e) {
      return emit(state.copyWith(status: ReportCharStatus.failure));
    }
  }
}
