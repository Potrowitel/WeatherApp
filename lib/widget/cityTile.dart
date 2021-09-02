import 'package:flutter/material.dart';

class CityTile extends StatelessWidget {
  final String city;
  final String country;
  final String temp;

  CityTile(this.city, this.country, this.temp);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 30.0,
            ),
            child: Text(
              city + ',' + country,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              right: 30.0,
            ),
            child: Text(
              temp + 'C',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
