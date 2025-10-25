import 'package:weather_api/models/current_model.dart';
import 'package:weather_api/models/forecast_model.dart';
import 'package:weather_api/models/location_model.dart';

class WeatherModel {
  final LocationModel locationModel;
  final CurrentModel current;
  final List<ForecastDayModel> forecastDayModel;

  WeatherModel({
    required this.locationModel,
    required this.current,
    required this.forecastDayModel,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final forecastList = (json['forecast']['forecastday'] as List)
        .map((e) => ForecastDayModel.fromJson(e))
        .toList();

    return WeatherModel(
      forecastDayModel: forecastList,
      locationModel: LocationModel.fromJson(json),
      current: CurrentModel.fromJson(json['current']),
    );
  }
}
