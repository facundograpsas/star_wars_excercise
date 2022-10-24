import 'package:equatable/equatable.dart';
import 'package:star_wars_excercise/models/character.dart';

abstract class ReportCharEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ReportChar extends ReportCharEvent {
  final Character character;
  ReportChar({required this.character});
}
