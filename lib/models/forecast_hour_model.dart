class ForecastHour {
  final String time;
  final double tempC;
  final String text;
  final String icon;

  ForecastHour({
    required this.time,
    required this.tempC,
    required this.text,
    required this.icon,
  });

  factory ForecastHour.fromJson(Map<String, dynamic> json) {
    return ForecastHour(
      time: json['time'],
      tempC: json['temp_c'],
      text: json['condition']['text'],
      icon: json['condition']['icon'],
    );
  }
}
