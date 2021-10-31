import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_tile.dart';


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
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(top:10.0, bottom:10.0),
                    child: Text(
                      "Temp",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                Text(
                  "High of temp, low of temp",
                  style: TextStyle(
                    color: Color(0xff9e9e9e),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600
                  )
                )
              ],
            )
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                  WeatherTile(title: "Temperature"),
                  WeatherTile(title: "Weather"),
                  WeatherTile(title: "Humidity"),
                  WeatherTile(title: "Wind Speed"),
              ],
            )
          )
          )
        ],
      )
    );
  }
}