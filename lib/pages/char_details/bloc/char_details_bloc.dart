import 'package:star_wars_excercise/models/planet.dart';
import 'package:star_wars_excercise/models/starship.dart';
import 'package:star_wars_excercise/models/vehicle.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_event.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_state.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:star_wars_excercise/repository/sw_repository.dart';

class CharDetailsBloc extends Bloc<CharDetailsEvent, CharDetailsState> {
  CharDetailsBloc({required this.repository})
      : super(const CharDetailsState()) {
    on<FetchExtraInfo>(_onFetchExtraInfo);
  }

  final SW_repositoryImpl repository;

  Future<void> _onFetchExtraInfo(
    FetchExtraInfo event,
    Emitter<CharDetailsState> emit,
  ) async {
    emit(state.copyWith(status: CharacterDetailsStatus.initial));
    if (await repository.isConnected()) {
      var starships = <Starship>[];
      var vehicles = <Vehicle>[];

      var planet = await repository.getPlanet(event.character.homeworld!);

      planet.fold(
          (failure) => Planet(name: failure.message), (planet) => planet);

      if (event.character.starships != null) {
        for (var element in event.character.starships!) {
          var starship = await repository.getStarship(element);

          starships.add(starship.fold(
              (failure) => Starship(name: failure.message),
              (starship) => starship));
        }
      }

      if (event.character.vehicles != null) {
        for (var element in event.character.vehicles!) {
          var vehicle = await repository.getVehicle(element);
          vehicles.add(vehicle.fold((failure) => Vehicle(name: failure.message),
              (vehicle) => vehicle));
        }
      }
      return emit(
        state.copyWith(
            status: CharacterDetailsStatus.success,
            character: event.character,
            planet: planet.fold(
                (failure) => Planet(name: failure.message), (planet) => planet),
            starships: starships,
            vehicles: vehicles),
      );
    } else {
      return emit(state.copyWith(status: CharacterDetailsStatus.failure));
    }
  }
}
