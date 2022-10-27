class Vehicle {
  Vehicle({
    required this.name,
    this.model,
    this.manufacturer,
    this.costInCredits,
    this.length,
    this.maxAtmospheringSpeed,
    this.crew,
    this.passengers,
    this.cargoCapacity,
    this.consumables,
    this.vehicleClass,
    this.pilots,
  });
  late final String name;
  late final String? model;
  late final String? manufacturer;
  late final String? costInCredits;
  late final String? length;
  late final String? maxAtmospheringSpeed;
  late final String? crew;
  late final String? passengers;
  late final String? cargoCapacity;
  late final String? consumables;
  late final String? vehicleClass;
  late final List<String>? pilots;

  Vehicle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    model = json['model'];
    manufacturer = json['manufacturer'];
    costInCredits = json['cost_in_credits'];
    length = json['length'];
    maxAtmospheringSpeed = json['max_atmosphering_speed'];
    crew = json['crew'];
    passengers = json['passengers'];
    cargoCapacity = json['cargo_capacity'];
    consumables = json['consumables'];
    vehicleClass = json['vehicle_class'];
    pilots = List.castFrom<dynamic, String>(json['pilots']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['model'] = model;
    _data['manufacturer'] = manufacturer;
    _data['cost_in_credits'] = costInCredits;
    _data['length'] = length;
    _data['max_atmosphering_speed'] = maxAtmospheringSpeed;
    _data['crew'] = crew;
    _data['passengers'] = passengers;
    _data['cargo_capacity'] = cargoCapacity;
    _data['consumables'] = consumables;
    _data['vehicle_class'] = vehicleClass;
    _data['pilots'] = pilots;
    return _data;
  }
}
