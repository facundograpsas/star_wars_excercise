import 'package:flutter/material.dart';
import 'package:star_wars_excercise/constants/strings.dart';
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
      DetailItem(title: NOMBRE, info: character.name!),
      DetailItem(title: GENERO, info: character.gender!),
      DetailItem(title: PESO, info: character.mass!),
      DetailItem(title: ALTURA, info: character.height!),
      DetailItem(title: COLOR_DE_OJOS, info: character.eyeColor!),
      DetailItem(title: COLOR_DE_PELO, info: character.hairColor!),
      state.status == CharacterDetailsStatus.initial
          ? initExtraDetails()
          : state.status == CharacterDetailsStatus.success
              ? successExtraDetails(state)
              : failureExtraDetails(),
    ]);
  }
}

Widget initExtraDetails() {
  return Column(children: const [
    DetailItem(title: MUNDO_NATAL, info: '...', animated: true),
    DetailItem(title: NAVES, info: '...', animated: true),
    DetailItem(title: VEHICULOS, info: '...', animated: true),
  ]);
}

Widget failureExtraDetails() {
  return Column(children: const [
    DetailItem(title: MUNDO_NATAL, info: ERROR_DETALLES),
    DetailItem(title: NAVES, info: ERROR_DETALLES),
    DetailItem(title: VEHICULOS, info: ERROR_DETALLES),
  ]);
}

Widget successExtraDetails(CharDetailsState state) {
  return Column(children: [
    DetailItem(title: MUNDO_NATAL, info: state.planet!.name),
    DetailItem(
        title: NAVES, info: state.starships!.map((e) => e.name).join(' - ')),
    DetailItem(
        title: VEHICULOS, info: state.vehicles!.map((e) => e.name).join(' - ')),
  ]);
}
