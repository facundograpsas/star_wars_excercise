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
