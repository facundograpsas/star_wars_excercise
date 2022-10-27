import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_excercise/constants/colors.dart';
import 'package:star_wars_excercise/constants/strings.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_bloc.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_event.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_state.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Text(
              CONEXION,
              style: TextStyle(
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            ConnectionSwitch(),
          ],
        ),
      ),
    );
  }
}

class ConnectionSwitch extends StatefulWidget {
  const ConnectionSwitch({super.key});

  @override
  State<ConnectionSwitch> createState() => _ConnectionSwitchState();
}

class _ConnectionSwitchState extends State<ConnectionSwitch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, AppConnectionState>(
      builder: ((context, state) {
        return Switch(
          value: state.connection,
          activeColor: AppColors.red,
          onChanged: (bool value) {
            if (value) {
              context.read<ConnectionBloc>().add(TurnOn());
            } else {
              context.read<ConnectionBloc>().add(TurnOff());
            }
          },
        );
      }),
    );
  }
}
