import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/services/api_services.dart';
import 'package:weather_api/utils/colors.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

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

          final data1 = snapshot.data!;
          return SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network("http:${data1.forecastDayModel[1].icon}"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tomorrow",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Text(
                            data1.forecastDayModel[1].text,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "${data1.forecastDayModel[1].avgTempC}°",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Temp",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "${snapshot.data!.forecastDayModel[1].avgTempC}°",
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
                            "${snapshot.data!.forecastDayModel[1].avgvisKm}km/h",
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                  SizedBox(height: 30),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "In ${data1.forecastDayModel.length} Days",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data1.forecastDayModel.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        final data2 = data1.forecastDayModel[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatWeek(data2.date),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network("https:${data2.icon}"),
                                SizedBox(width: 30),
                                Text(
                                  data2.text,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${data2.minTempC}°",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "${data2.maxTempC}°",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(vertical: 15);
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

  String formatWeek(String week) {
    final dateTime = DateTime.parse(week);
    return DateFormat('EEE').format(dateTime);
  }
}
