import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_bloc.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/report_char_bloc.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_bloc.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_event.dart';
import 'package:star_wars_excercise/pages/home_page/home_screen.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_bloc.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_event.dart';
import 'package:star_wars_excercise/repository/sw_repository.dart';
import 'package:star_wars_excercise/utils.dart';

void main() async {
  await Hive.initFlutter();
  await initDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ConnectionBloc(
                repository: SW_repositoryImpl(api: RestClient(Dio())))
              ..add(TurnInit())),
        BlocProvider(
            create: (_) => CharactersBloc(
                api: RestClient(Dio()),
                repository: SW_repositoryImpl(api: RestClient(Dio())))
              ..add(InitialFetch())),
        BlocProvider(
            create: (_) => CharDetailsBloc(
                repository: SW_repositoryImpl(api: RestClient(Dio())))),
        BlocProvider(
            create: (_) => ReportCharBloc(
                repository: SW_repositoryImpl(
                    api: RestClient(Dio(),
                        baseUrl: 'https://jsonplaceholder.typicode.com'))))
      ],
      child: MaterialApp(
          title: 'Report Invaders',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black, foregroundColor: Colors.amber),
            fontFamily: 'Play',
            backgroundColor: Colors.black,
          ),
          home: const HomeScreen(title: 'Report Invaders')),
    );
  }
}
