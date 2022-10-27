import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:star_wars_excercise/models/starship.dart';
import 'package:star_wars_excercise/models/vehicle.dart';

import '../api/api.dart';
import '../models/character.dart';
import '../models/planet.dart';
import '../models/report.dart';

abstract class SW_repository {
  Future<Either<Failure, ApiResponse>> getCharacters(String page);

  Future<Either<Failure, Planet>> getPlanet(String number);

  Future<Either<Failure, Starship>> getStarship(String number);

  Future<Either<Failure, Vehicle>> getVehicle(String number);

  Future<Either<Failure, Report>> createReport(Report report);
}

class Failure {
  String message;
  Failure(this.message);
}

class SW_repositoryImpl extends SW_repository {
  SW_repositoryImpl({required this.api});

  final RestClient api;

  bool connection = true;

  Future<bool> isConnected() async {
    var box = await Hive.openBox('connection');
    var connection = box.get('isConnected');
    return connection;
  }

  void setConnection(isConnected) {
    var box = Hive.box('connection');
    box.put('isConnected', isConnected);
    connection = isConnected;
  }

  @override
  Future<Either<Failure, ApiResponse>> getCharacters(page) async {
    try {
      var results = await api.getCharacters(page);
      return right(results);
    } on DioError catch (error) {
      if (error.isNoConnectionError) {
        return left(
            Failure('No estás conectado a internet. Revisa tu conexión'));
      } else if (error.response != null) {
        return left(Failure(error.response!.statusMessage!));
      } else {
        return left(Failure('Error desconocido, intenta de nuevo más tarde'));
      }
    }
  }

  @override
  Future<Either<Failure, Report>> createReport(Report report) async {
    try {
      var results = await api.createReport(report);
      return right(results);
    } on DioError catch (error) {
      if (error.isNoConnectionError) {
        return left(
            Failure('No estás conectado a internet. Revisa tu conexión'));
      } else if (error.response != null) {
        return left(Failure(error.response!.statusMessage!));
      } else {
        return left(Failure('Error desconocido, intenta de nuevo más tarde'));
      }
    }
  }

  @override
  Future<Either<Failure, Planet>> getPlanet(String number) async {
    try {
      var results = await api.getPlanet(number);
      return right(results);
    } on DioError catch (error) {
      if (error.isNoConnectionError) {
        return left(
            Failure('No estás conectado a internet. Revisa tu conexión'));
      } else if (error.response != null) {
        return left(Failure(error.response!.statusMessage!));
      } else {
        return left(Failure('Error desconocido, intenta de nuevo más tarde'));
      }
    }
  }

  @override
  Future<Either<Failure, Starship>> getStarship(String number) async {
    try {
      var results = await api.getStarships(number);
      return right(results);
    } on DioError catch (error) {
      if (error.isNoConnectionError) {
        return left(
            Failure('No estás conectado a internet. Revisa tu conexión'));
      } else if (error.response != null) {
        return left(Failure(error.response!.statusMessage!));
      } else {
        return left(Failure('Error desconocido, intenta de nuevo más tarde'));
      }
    }
  }

  @override
  Future<Either<Failure, Vehicle>> getVehicle(String number) async {
    try {
      var results = await api.getVehicles(number);
      return right(results);
    } on DioError catch (error) {
      if (error.isNoConnectionError) {
        return left(
            Failure('No estás conectado a internet. Revisa tu conexión'));
      } else if (error.response != null) {
        return left(Failure(error.response!.statusMessage!));
      } else {
        return left(Failure('Error desconocido, intenta de nuevo más tarde'));
      }
    }
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other &&
      error is SocketException; // import 'dart:io' for SocketException
}
