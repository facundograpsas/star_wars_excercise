import 'package:equatable/equatable.dart';
import 'package:star_wars_excercise/models/character.dart';
import 'package:star_wars_excercise/models/planet.dart';
import 'package:star_wars_excercise/models/starship.dart';

import '../../../models/vehicle.dart';

enum CharacterDetailsStatus { initial, success, failure }

class CharDetailsState extends Equatable {
  const CharDetailsState(
      {this.status = CharacterDetailsStatus.initial,
      this.character,
      this.planet,
      this.starships = const <Starship>[],
      this.vehicles = const <Vehicle>[]});

  final CharacterDetailsStatus status;
  final Planet? planet;
  final List<Starship>? starships;
  final List<Vehicle>? vehicles;
  final Character? character;

  CharDetailsState copyWith(
      {CharacterDetailsStatus? status,
      Character? character,
      Planet? planet,
      List<Starship>? starships,
      List<Vehicle>? vehicles}) {
    return CharDetailsState(
        status: status ?? this.status,
        character: character ?? this.character,
        planet: planet ?? this.planet,
        starships: starships ?? this.starships,
        vehicles: vehicles ?? this.vehicles);
  }

  @override
  List<Object?> get props => [status, planet, vehicles, starships];
}
