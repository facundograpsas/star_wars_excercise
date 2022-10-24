import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:star_wars_excercise/models/character.dart';
import 'package:star_wars_excercise/models/planet.dart';
import 'package:star_wars_excercise/models/report.dart';
import 'package:star_wars_excercise/models/starship.dart';
import 'package:star_wars_excercise/models/vehicle.dart';
part 'api.g.dart';

@RestApi(baseUrl: "https://swapi.dev/api")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/people/?page={number}")
  Future<ApiResponse> getCharacters(@Path("number") String number);

  @GET("/planets/{number}")
  Future<Planet> getPlanet(@Path("number") String number);

  @GET("/starships/{number}")
  Future<Starship> getStarships(@Path("number") String number);

  @GET("/vehicles/{number}")
  Future<Vehicle> getVehicles(@Path("number") String number);

  @POST("/posts")
  Future<Report> createReport(@Body() Report report);
}
