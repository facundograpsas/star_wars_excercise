import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialFetch extends CharacterEvent {}

class FetchNextPage extends CharacterEvent {}

class FetchPreviousPage extends CharacterEvent {}
