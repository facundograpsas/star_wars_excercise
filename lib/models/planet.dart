class Planet {
  Planet({
    required this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
    this.residents,
  });
  late final String name;
  late final String? rotationPeriod;
  late final String? orbitalPeriod;
  late final String? diameter;
  late final String? climate;
  late final String? gravity;
  late final String? terrain;
  late final String? surfaceWater;
  late final String? population;
  late final List<String>? residents;

  Planet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rotationPeriod = json['rotation_period'];
    orbitalPeriod = json['orbital_period'];
    diameter = json['diameter'];
    climate = json['climate'];
    gravity = json['gravity'];
    terrain = json['terrain'];
    surfaceWater = json['surface_water'];
    population = json['population'];
    residents = List.castFrom<dynamic, String>(json['residents']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['rotation_period'] = rotationPeriod;
    _data['orbital_period'] = orbitalPeriod;
    _data['diameter'] = diameter;
    _data['climate'] = climate;
    _data['gravity'] = gravity;
    _data['terrain'] = terrain;
    _data['surface_water'] = surfaceWater;
    _data['population'] = population;
    _data['residents'] = residents;
    return _data;
  }
}
