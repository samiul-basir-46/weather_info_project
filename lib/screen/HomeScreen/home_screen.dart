import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/screen/ForeCastScreen/forecast_screen.dart';
import 'package:weather_api/services/api_services.dart';
import 'package:weather_api/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: FutureBuilder(
        future: ApiServices.weatherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, color: Colors.white, size: 35),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF061220),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.sunny, color: Colors.white),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.shield_moon,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    "${snapshot.data!.locationModel.name},${snapshot.data!.locationModel.country}",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "Today,${weekDay(snapshot.data!.locationModel.localTime)}",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  SizedBox(height: 20),
                  Image.network(
                    "https:${snapshot.data!.current.condition.icon}",
                  ),
                  Text(
                    "${snapshot.data!.current.temp_c}°",
                    style: TextStyle(color: Colors.white, fontSize: 55),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data!.current.condition.text,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Temp",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "${snapshot.data!.current.feelsLike_c}°",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Wind",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "${snapshot.data!.current.wind_kph}km/h",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "${snapshot.data!.current.humidity}%",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForecastScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "View Full Reports",
                          style: TextStyle(color: Color(0xFF6181e7)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot
                          .data!
                          .forecastDayModel[0]
                          .forecastHour
                          .length,
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final data = snapshot
                            .data!
                            .forecastDayModel[0]
                            .forecastHour[index];
                        return Column(
                          children: [
                            Image.network("https:${data.icon}"),
                            Text(
                              formatTime(data.time),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "${data.tempC}°",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 25);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String formatTime(String time) {
    final dateTime = DateTime.parse(time);
    return DateFormat('h a').format(dateTime);
  }

  String weekDay(String time){
    final dateTime = DateTime.parse(time);
    final getWeek = DateFormat('MMM').format(dateTime);
    final getDate = DateFormat('dd').format(dateTime);
    return "$getDate $getWeek";
  }

}
