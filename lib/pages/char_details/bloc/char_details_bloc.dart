import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/models/starship.dart';
import 'package:star_wars_excercise/models/vehicle.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_event.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_state.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

class CharDetailsBloc extends Bloc<CharDetailsEvent, CharDetailsState> {
  CharDetailsBloc({required this.api}) : super(const CharDetailsState()) {
    on<FetchExtraInfo>(_onFetchExtraInfo);
  }

  final RestClient api;

  Future<void> _onFetchExtraInfo(
    FetchExtraInfo event,
    Emitter<CharDetailsState> emit,
  ) async {
    emit(state.copyWith(status: CharacterDetailsStatus.initial));
    try {
      var starships = <Starship>[];
      var vehicles = <Vehicle>[];

      var planet = await api.getPlanet(event.character.homeworld!);

      if (event.character.starships != null) {
        for (var element in event.character.starships!) {
          var starship = await api.getStarships(element);
          starships.add(starship);
        }
      }

      if (event.character.vehicles != null) {
        for (var element in event.character.vehicles!) {
          var vehicle = await api.getVehicles(element);
          vehicles.add(vehicle);
        }
      }
      return emit(
        state.copyWith(
            status: CharacterDetailsStatus.success,
            character: event.character,
            planet: planet,
            starships: starships,
            vehicles: vehicles),
      );
    } catch (_) {}
  }
}
