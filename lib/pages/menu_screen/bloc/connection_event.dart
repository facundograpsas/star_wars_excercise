import 'package:equatable/equatable.dart';

abstract class ConnectionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TurnOn extends ConnectionEvent {}

class TurnOff extends ConnectionEvent {}
