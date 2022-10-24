import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_excercise/api/api.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/char_details_bloc.dart';
import 'package:star_wars_excercise/pages/char_details/bloc/report_char_bloc.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_bloc.dart';
import 'package:star_wars_excercise/pages/home_page/bloc/all_characters_event.dart';
import 'package:star_wars_excercise/pages/home_page/home_screen.dart';
import 'package:star_wars_excercise/pages/menu_screen/bloc/connection_bloc.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ConnectionBloc()),
        BlocProvider(
            create: (_) =>
                CharactersBloc(api: RestClient(Dio()))..add(InitialFetch())),
        BlocProvider(create: (_) => CharDetailsBloc(api: RestClient(Dio()))),
        BlocProvider(
            create: (_) => ReportCharBloc(
                api: RestClient(Dio(),
                    baseUrl: 'https://jsonplaceholder.typicode.com')))
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
          home: HomeScreen(title: 'Report Invaders')),
    );
  }
}
