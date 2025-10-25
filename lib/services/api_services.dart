import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_api/models/weather_model.dart';

class ApiServices {
  static Future<WeatherModel> weatherData() async {
    final url = Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=72e7e4f689134be0b3640336252309&q=dhaka&days=4",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception("Failed");
    }
  }
}
