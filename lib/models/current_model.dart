import 'package:weather_api/models/condition_model.dart';

class CurrentModel {
  final double temp_c;
  final double wind_mph;
  final int humidity;
  final double feelsLike_c;
  final double wind_kph;
  final ConditionModel condition;

  CurrentModel({
    required this.feelsLike_c,
    required this.temp_c,
    required this.wind_kph,
    required this.wind_mph,
    required this.humidity,
    required this.condition,

  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      feelsLike_c: (json['feelslike_c']),
      temp_c: json['temp_c'],
      wind_kph: json['wind_kph'],
      wind_mph: json['wind_mph'],
      humidity: json['humidity'],
      condition: ConditionModel.fromJson(json['condition'])
    );
  }
}
