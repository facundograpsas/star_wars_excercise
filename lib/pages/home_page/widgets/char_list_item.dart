import 'package:flutter/material.dart';
import 'package:star_wars_excercise/constants/colors.dart';
import 'package:star_wars_excercise/constants/strings.dart';

import '../../../models/character.dart';
import '../../char_details/char_details_screen.dart';

class CharListItem extends StatelessWidget {
  const CharListItem({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.black,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.whiteCardBoder, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 200,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: AppColors.red,
            onTap: () {
              Navigator.of(context).push(_createRoute(character));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      NOMBRE,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      character.name!,
                      style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      GENERO,
                      style: TextStyle(fontSize: 16, color: AppColors.white),
                    ),
                    Text(
                      character.gender!,
                      style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute(character) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        CharacterDetailsScreen(
      character: character,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
