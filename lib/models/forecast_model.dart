import 'package:weather_api/models/forecast_hour_model.dart';

class ForecastDayModel {
  final double maxTempC;
  final double minTempC;
  final String text;
  final String icon;
  final String date;
  final double avgTempC;
  final double avgvisKm;
  final double avghumidity;
  final List<ForecastHour> forecastHour;

  ForecastDayModel({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.text,
    required this.icon,
    required this.forecastHour,
    required this.avgTempC,
    required this.avgvisKm,
    required this.avghumidity,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    var forecastHourList = (json['hour'] as List)
        .map((e) => ForecastHour.fromJson(e))
        .toList();

    return ForecastDayModel(
      avghumidity: (json['day']['avghumidity'] as num).toDouble(),
      avgvisKm: (json['day']['avgvis_km'] as num).toDouble(),
      avgTempC: (json['day']['avgtemp_c'] as num).toDouble(),
      date: json['date'],
      maxTempC: json['day']['maxtemp_c'],
      minTempC: json['day']['mintemp_c'],
      text: json['day']['condition']['text'],
      icon: json['day']['condition']['icon'],
      forecastHour: forecastHourList,
    );
  }
}
