class Report {
  Report({
    this.id,
    required this.userId,
    required this.dateTime,
    required this.characterName,
  });
  int? id;
  late final int userId;
  late final String dateTime;
  late final String characterName;

  Report.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    dateTime = json['dateTime'];
    characterName = json['character_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['dateTime'] = dateTime;
    _data['character_name'] = characterName;
    _data['id'] = id;

    return _data;
  }
}
