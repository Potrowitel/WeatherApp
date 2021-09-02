import 'package:flutter/material.dart';
import 'package:weather_app/widget/weatherElem.dart';

class EverydayWeather extends StatelessWidget {
  const EverydayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 100,
      width: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 6),
            ),
          ]),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.wb_cloudy,
                size: 40,
                color: Colors.grey,
              ),
            ),
            Text(
              'Mon,21',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '35\u00B0C',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 8),
                ),
                Icon(
                  Icons.arrow_upward_rounded,
                  size: 8.0,
                  color: Colors.grey,
                ),
                SizedBox(width: 2.0),
                Text(
                  '26\u00B0C',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 8),
                ),
                Icon(
                  Icons.arrow_downward_rounded,
                  size: 8.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
