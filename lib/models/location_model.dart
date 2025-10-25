class LocationModel {
  final String name;
  final String country;


  LocationModel({
    required this.name,
    required this.country,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['location']['name'],
      country: json['location']['country'],
    );
  }
}
