import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'weather_tile.dart';

class MainWidget extends StatelessWidget {
  var location;
  var temp;
  var tempMin;
  var tempMax;
  var weather;
  var humidity;
  var windSpeed;

  MainWidget({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "${location.toString()}",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top:10.0, bottom:10.0),
                  child: Text(
                    "${temp.toInt().toString()}°",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ],
            )
        ),
        Expanded(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                WeatherTile(icon: Icons.thermostat_outlined, title: "Temperature", subtitle: "${temp.toInt().toString()}°"),
                WeatherTile(icon: Icons.thermostat_outlined, title: "Max Temp", subtitle: "${tempMax.toInt().toString()}°"),
                WeatherTile(icon: Icons.thermostat_outlined, title: "Min Temp", subtitle: "${tempMin.toInt().toString()}°"),
                WeatherTile(icon: Icons.filter_drama_outlined, title: "Weather", subtitle: "${weather.toString()}"),
                WeatherTile(icon: Icons.wb_sunny_outlined, title: "Humidity", subtitle: "${humidity.toString()} %"),
                WeatherTile(icon: Icons.waves_outlined, title: "Wind Speed", subtitle: "${windSpeed.toString()} MPH"),
              ],
            )
        )
        )
      ],
    );
  }
}