import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_event.dart';
import 'package:star_wars_excercise/models/character.dart';
import 'package:stream_transform/stream_transform.dart';
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'all_characters_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

class CharactersBloc extends Bloc<CharacterEvent, CharacterState> {
  CharactersBloc({required this.api}) : super(const CharacterState()) {
    on<InitialFetch>(
      _onPostFetched,
    );
    on<FetchNextPage>(_onNextPageFetched);
    on<FetchPreviousPage>(_onPreviousPageFetched);
    on<IsConnected>(_setConnection);
  }

  final RestClient api;

  Future<void> _setConnection(
    IsConnected event,
    Emitter<CharacterState> emit,
  ) async {
    emit(state.copyWith(connection: event.connection));
  }

  Future<void> _onPreviousPageFetched(
    FetchPreviousPage event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.connection) {
      try {
        emit(
          state.copyWith(page: state.page - 1, status: CharacterStatus.loading),
        );
        final response = await _fetchPosts(state.page);
        return emit(
          state.copyWith(
              status: CharacterStatus.success,
              characters: response.results,
              page: state.page),
        );
      } catch (_) {
        emit(state.copyWith(status: CharacterStatus.failure));
      }
    } else {
      emit(state.copyWith(status: CharacterStatus.failure));
    }
  }

  Future<void> _onNextPageFetched(
    FetchNextPage event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.connection) {
      try {
        emit(
          state.copyWith(status: CharacterStatus.loading, page: state.page + 1),
        );
        final response = await _fetchPosts(state.page);
        return emit(
          state.copyWith(
              status: CharacterStatus.success,
              characters: response.results,
              page: state.page),
        );
      } catch (_) {
        emit(state.copyWith(status: CharacterStatus.failure));
      }
    } else {
      emit(state.copyWith(status: CharacterStatus.failure));
    }
  }

  Future<void> _onPostFetched(
    InitialFetch event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.connection) {
      try {
        if (state.status == CharacterStatus.loading) {
          final response = await _fetchPosts(state.page);
          return emit(
            state.copyWith(
                status: CharacterStatus.success,
                characters: response.results,
                page: state.page),
          );
        }
      } catch (_) {
        emit(state.copyWith(status: CharacterStatus.failure));
      }
    } else {
      emit(state.copyWith(status: CharacterStatus.failure));
    }
  }

  Future<ApiResponse> _fetchPosts(
    page,
  ) async {
    final response = await api.getCharacters(page.toString());
    return response;
  }
}
