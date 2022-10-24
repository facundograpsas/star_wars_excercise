class Starship {
  Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.MGLT,
    required this.starshipClass,
  });
  late final String name;
  late final String model;
  late final String manufacturer;
  late final String costInCredits;
  late final String length;
  late final String maxAtmospheringSpeed;
  late final String crew;
  late final String passengers;
  late final String cargoCapacity;
  late final String consumables;
  late final String hyperdriveRating;
  late final String MGLT;
  late final String starshipClass;

  Starship.fromJson(Map<String, dynamic> json) {
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
    hyperdriveRating = json['hyperdrive_rating'];
    MGLT = json['MGLT'];
    starshipClass = json['starship_class'];
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
    _data['hyperdrive_rating'] = hyperdriveRating;
    _data['MGLT'] = MGLT;
    _data['starship_class'] = starshipClass;
    return _data;
  }
}
