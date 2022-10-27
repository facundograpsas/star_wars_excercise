import 'dart:developer';

import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_event.dart';
import 'package:star_wars_excercise/models/character.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_bloc.dart';
import 'package:star_wars_excercise/repository/sw_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'all_characters_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

class CharactersBloc extends Bloc<CharacterEvent, CharacterState> {
  CharactersBloc({required this.api, required this.repository})
      : super(const CharacterState()) {
    on<InitialFetch>(
      _onPostFetched,
    );
    on<FetchNextPage>(_onNextPageFetched);
    on<FetchPreviousPage>(_onPreviousPageFetched);
  }

  final RestClient api;
  final SW_repositoryImpl repository;

  Future<void> _onPreviousPageFetched(
    FetchPreviousPage event,
    Emitter<CharacterState> emit,
  ) async {
    if (await repository.isConnected()) {
      emit(
        state.copyWith(page: state.page - 1, status: CharacterStatus.loading),
      );
      await _fetchCharacters(emit);
    } else {
      emit(state.copyWith(
          status: CharacterStatus.failure,
          errorMessage: 'Activa la conexión en el menú'));
    }
  }

  Future<void> _onNextPageFetched(
    FetchNextPage event,
    Emitter<CharacterState> emit,
  ) async {
    if (await repository.isConnected()) {
      emit(
        state.copyWith(status: CharacterStatus.loading, page: state.page + 1),
      );
      await _fetchCharacters(emit);
    } else {
      emit(state.copyWith(
          status: CharacterStatus.failure,
          errorMessage: 'Activa la conexión en el menú'));
    }
  }

  Future<void> _onPostFetched(
    InitialFetch event,
    Emitter<CharacterState> emit,
  ) async {
    if (await repository.isConnected()) {
      await _fetchCharacters(emit);
    } else {
      emit(state.copyWith(
          status: CharacterStatus.failure,
          errorMessage: 'Activa la conexión en el menú'));
    }
  }

  Future<void> _fetchCharacters(Emitter<CharacterState> emit) async {
    final response = await repository.getCharacters(state.page.toString());
    response.fold(
        (failure) => emit(state.copyWith(
            status: CharacterStatus.failure, errorMessage: failure.message)),
        (response) => emit(
              state.copyWith(
                  status: CharacterStatus.success,
                  characters: response.results,
                  page: state.page),
            ));
  }
}
