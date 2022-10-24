import 'package:equatable/equatable.dart';
import 'package:star_wars_excercise/models/character.dart';

enum CharacterStatus { loading, success, failure }

class CharacterState extends Equatable {
  const CharacterState(
      {this.status = CharacterStatus.loading,
      this.connection = true,
      this.characters = const <Character>[],
      this.page = 1});

  final CharacterStatus status;
  final List<Character> characters;
  final int page;
  final bool connection;

  CharacterState copyWith(
      {CharacterStatus? status,
      List<Character>? characters,
      int? page,
      bool? connection}) {
    return CharacterState(
        connection: connection ?? this.connection,
        status: status ?? this.status,
        characters: characters ?? this.characters,
        page: page ?? this.page);
  }

  @override
  List<Object> get props => [status, characters, page, connection];
}
