import 'package:flutter/material.dart';
import 'package:star_wars_excercise/models/character.dart';

import '../bloc/char_details_state.dart';
import 'detail_item.dart';

class CharDetailsList extends StatelessWidget {
  const CharDetailsList(
      {Key? key, required this.character, required this.state})
      : super(key: key);

  final Character character;
  final CharDetailsState state;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DetailItem(title: 'Nombre', info: character.name!),
      DetailItem(title: 'Género', info: character.gender!),
      DetailItem(title: 'Peso', info: character.mass!),
      DetailItem(title: 'Altura', info: character.height!),
      DetailItem(title: 'Color de ojos', info: character.eyeColor!),
      DetailItem(title: 'Color de pelo', info: character.hairColor!),
      state.status == CharacterDetailsStatus.success
          ? DetailItem(title: 'Mundo natal', info: state.planet!.name)
          : const DetailItem(title: 'Mundo natal', info: '...', animated: true),
      state.status == CharacterDetailsStatus.success
          ? DetailItem(
              title: 'Naves',
              info: state.starships!.map((e) => e.name).join(' - '))
          : const DetailItem(
              title: 'Naves',
              info: '...',
              animated: true,
            ),
      state.status == CharacterDetailsStatus.success
          ? DetailItem(
              title: 'Vehículos',
              info: state.vehicles!.map((e) => e.name).join(' - '),
            )
          : const DetailItem(title: 'Vehiculos', info: '...', animated: true),
    ]);
  }
}
