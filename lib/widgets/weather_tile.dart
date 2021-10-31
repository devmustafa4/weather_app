import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget{
  IconData icon;
  String title;
  String subtitle;

  WeatherTile({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.lightBlueAccent,)
        ],
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff9e9e9e)
        ),
      ),
      subtitle: Text(
          subtitle,
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(0xff9e9e9e)
          )
      ),
    );
  }
}