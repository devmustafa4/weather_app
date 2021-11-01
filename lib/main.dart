import 'dart:io';
import 'package:weather_app/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather (cityName) async {
  const apiKey = "99994d9768f8a3cead741586b8d822f7";
  var requestURL = "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&units=imperial&appid=${apiKey}";

  var response = await http.get(Uri.parse(requestURL));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error Loading request URL info.");
  }
}

class WeatherInfo{
  var location;
  var temp;
  var tempMin;
  var tempMax;
  var weather;
  var humidity;
  var windSpeed;

  WeatherInfo({
   required this.location,
   required this.temp,
   required this.tempMin,
   required this.tempMax,
   required this.weather,
   required this.humidity,
    required this.windSpeed,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        weather: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed']);

  }
}

void main() => runApp(
  MaterialApp(
    title:  "Weather App",
    home: MyApp()
  )
);

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {

  late Future<WeatherInfo> futureWeather;

  @override
  void initState(){
    super.initState();
    futureWeather = fetchWeather("Taxila");
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather App"
          ),
        ),
      body: FutureBuilder<WeatherInfo>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return MainWidget(
            location: snapshot.data!.location,
            temp: snapshot.data!.temp,
            tempMin: snapshot.data!.tempMin,
            tempMax: snapshot.data!.tempMax,
            weather: snapshot.data!.weather,
            humidity: snapshot.data!.humidity,
            windSpeed: snapshot.data!.windSpeed);
          } else if (snapshot.hasError) {
              return Center(
                  child:Text("${snapshot.error}")
              );
        }
          return CircularProgressIndicator();
      }
    )
    );
  }
}