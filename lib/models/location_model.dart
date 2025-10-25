class LocationModel {
  final String name;
  final String country;
  final String localTime;

  LocationModel({
    required this.name,
    required this.country,
    required this.localTime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      country: json['country'],
      localTime: json['localtime']
    );
  }
}
