import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_bloc.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_event.dart';
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
            Text('Conexión:'),
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
    return BlocConsumer<ConnectionBloc, AppConnectionState>(
      listener: (context, state) {
        context
            .read<CharactersBloc>()
            .add(IsConnected(connection: state.connection));
      },
      builder: ((context, state) {
        return Switch(
          value: state.connection,
          activeColor: Colors.red,
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
