import 'package:equatable/equatable.dart';
import 'package:star_wars_excercise/models/character.dart';

enum CharacterStatus { loading, success, failure }

class CharacterState extends Equatable {
  const CharacterState(
      {this.status = CharacterStatus.loading,
      this.errorMessage = '',
      this.characters = const <Character>[],
      this.page = 1});

  final CharacterStatus status;
  final List<Character> characters;
  final int page;
  final String errorMessage;

  CharacterState copyWith(
      {CharacterStatus? status,
      List<Character>? characters,
      int? page,
      bool? connection,
      String? errorMessage}) {
    return CharacterState(
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        characters: characters ?? this.characters,
        page: page ?? this.page);
  }

  @override
  List<Object> get props => [status, characters, page, errorMessage];
}
