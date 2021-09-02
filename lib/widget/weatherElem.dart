import 'package:flutter/material.dart';

class WeatherElement extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  WeatherElement(this.title, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 30,
            color: Colors.grey,
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.black),
          ),
          Text(
            title,
            style:
                Theme.of(context).textTheme.headline1?.copyWith(fontSize: 8.0),
          ),
        ],
      ),
    );
  }
}
