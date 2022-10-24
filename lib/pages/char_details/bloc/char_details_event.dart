import 'package:equatable/equatable.dart';
import 'package:star_wars_excercise/models/character.dart';

abstract class CharDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchExtraInfo extends CharDetailsEvent {
  final Character character;
  FetchExtraInfo({required this.character});
}
