import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget{
  String title;

  WeatherTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff9e9e9e)
        ),
      ),

    );
  }
}