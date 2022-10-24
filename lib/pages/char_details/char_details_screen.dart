import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/models/character.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_bloc.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_event.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_state.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/report_char_bloc.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/report_char_state.dart';
import 'package:star_wars_excercise/pages/char_details/widgets/char_details.dart';
import 'package:star_wars_excercise/pages/char_details/widgets/report_button.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_bloc.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);
  final Character character;

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<CharDetailsBloc>()
        .add(FetchExtraInfo(character: widget.character));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).clearMaterialBanners();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<CharDetailsBloc, CharDetailsState>(
                  builder: ((context, state) {
                    return CharDetailsList(
                        character: widget.character, state: state);
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: BlocConsumer<ReportCharBloc, ReportCharState>(
                  listener: (context, state) {
                    if (state.status == ReportCharStatus.success) {
                      showMaterialBanner(context,
                          'Reporte de avistamiento exitoso', Icons.check);
                    } else if (state.status == ReportCharStatus.failure) {
                      showMaterialBanner(
                          context,
                          'Hubo un problema al procesar el reporte.',
                          Icons.check);
                    }
                  },
                  builder: ((context, state) {
                    return ReportButton(
                      character: widget.character,
                      state: state,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showMaterialBanner(BuildContext context, String message, IconData icon) {
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        content: Text(message),
        leading: Icon(icon),
        backgroundColor: Colors.amber,
        actions: [
          TextButton(
            child: const Text('Ignorar'),
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          )
        ]));
  }
}
