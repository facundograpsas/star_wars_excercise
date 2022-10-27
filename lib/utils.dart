import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

String formatPlanet(String planetUrl) {
  var splittedString = planetUrl.split('/');
  return splittedString[splittedString.length - 2].toString();
}

List<String> formatStarship(List<String> starshipsUrl) {
  var formattedStarship = starshipsUrl.map((e) {
    var splittedString = e.split('/');
    return splittedString[splittedString.length - 2].toString();
  }).toList();
  return formattedStarship;
}

List<String> formatVehicles(List<String> vehicleUrl) {
  var formattedVehicle = vehicleUrl.map((e) {
    var splittedString = e.split('/');
    return splittedString[splittedString.length - 2].toString();
  }).toList();
  return formattedVehicle;
}

Future<void> initDB() async {
  var box = await Hive.openBox('connection');
  if (!box.containsKey('isConnected')) {
    box.put('isConnected', true);
  }
}
