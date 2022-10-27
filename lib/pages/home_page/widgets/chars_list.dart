import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_bloc.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_state.dart';
import 'package:star_wars_excercise/pages/home_page/widgets/char_list_item.dart';
import '../../../constants/colors.dart';
import 'char_list_item.dart';

class CharsList extends StatefulWidget {
  final ScrollController scrollController;

  const CharsList({super.key, required this.scrollController});

  @override
  State<CharsList> createState() => _CharsListState();
}

class _CharsListState extends State<CharsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharacterState>(
      builder: (context, state) {
        switch (state.status) {
          case CharacterStatus.failure:
            return Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.white)),
                    width: 200,
                    height: 300,
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    )));
          case CharacterStatus.success:
            if (state.characters.isEmpty) {
              return const Center(child: Text('No enemies'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.characters.length
                    ? Container()
                    : CharListItem(character: state.characters[index]);
              },
              itemCount: state.characters.length,
              controller: widget.scrollController,
            );
          case CharacterStatus.loading:
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.red,
            ));
        }
      },
    );
  }
}
