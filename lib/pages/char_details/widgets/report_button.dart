import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_excercise/constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../models/character.dart';
import '../bloc/report_char_bloc.dart';
import '../bloc/report_char_event.dart';
import '../bloc/report_char_state.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({Key? key, required this.character, required this.state})
      : super(key: key);

  final Character character;
  final ReportCharState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: state.status == ReportCharStatus.loading
            ? null
            : () {
                ScaffoldMessenger.of(context).clearMaterialBanners();
                context
                    .read<ReportCharBloc>()
                    .add(ReportChar(character: character));
              },
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.amber),
        child: state.status == ReportCharStatus.loading
            ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: AppColors.red,
                ))
            : const Text(
                REPORTAR,
                style: TextStyle(
                    color: AppColors.red, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
