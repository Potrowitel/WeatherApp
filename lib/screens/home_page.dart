import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/data/weather.dart';
import 'package:weather_app/main.dart';
import '../data/cities.dart';
import '../help/ThemeColors.dart';
import '../widget/weatherElem.dart';
import '../widget/everydayWeather.dart';
import '../widget/dropdownList.dart';

class WeatherHomePage extends StatefulWidget {
  final List<Cities> cities;
  final List<WeatherData> weatherData;

  WeatherHomePage(this.cities, this.weatherData);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  bool _isVisible = false;
  String country = 'Kyrgyzstan';
  WeatherData selectedWeather =
      weatherData.firstWhere((element) => element.city == 'Bishkek');

  void refreshData(String city, String county, bool visible) {
    if (city == '') {
      setState(() {
        _isVisible = visible;
      });
    }
    setState(() {
      selectedWeather =
          weatherData.firstWhere((element) => element.city == city);
      country = this.country;
      _isVisible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Container(
                  height: mediaHeight / 3,
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                child: Text(
                                  'Sunday, 19 May 2019| 4:30PM',
                                  style: TextStyle(
                                    fontFamily: 'Barlow-Regular',
                                    fontSize: 14.0,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // width: 135,
                              decoration: BoxDecoration(
                                color: ThemeColors.locationBackground,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 48,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isVisible = true;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 14.0, left: 10.0),
                                        child: Text(
                                          selectedWeather.city + "," + country,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.location_on,
                                      size: 14,
                                      color: ThemeColors.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        height: 48,
                      ),
                      Container(
                        height: mediaHeight / 3 * 2 - 168,
                        child: GridView.count(
                          crossAxisCount: 3,
                          padding: const EdgeInsets.all(20.0),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          physics: new NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    selectedWeather.weather,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    selectedWeather.temp,
                                    style: TextStyle(
                                      fontFamily: 'Barlow-Light',
                                      fontSize: 70,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    //'\u00B0C',
                                    '',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontFamily: 'Barlow-Medium',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                padding: const EdgeInsets.only(
                                    top: 22.0, left: 35.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          selectedWeather.tempH + '\u00B0C',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Icon(
                                            Icons.arrow_upward,
                                            size: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: [
                                        Text(
                                          selectedWeather.tempL + '\u00B0C',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Icon(
                                            Icons.arrow_downward,
                                            size: 12.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Container(
                              child: WeatherElement(
                                'Humidity',
                                selectedWeather.humidity + '%',
                                Icons.hourglass_empty_outlined,
                              ),
                            ),
                            Container(
                              child: WeatherElement(
                                'Pressure',
                                selectedWeather.pressure + 'mBar',
                                Icons.hourglass_empty_outlined,
                              ),
                            ),
                            Container(
                              child: WeatherElement(
                                'Wind',
                                selectedWeather.wind + 'km/h',
                                Icons.hourglass_empty_outlined,
                              ),
                            ),
                            Container(
                              child: WeatherElement(
                                'Sunrise',
                                selectedWeather.sunrise + 'AM',
                                Icons.hourglass_empty_outlined,
                              ),
                            ),
                            Container(
                              child: WeatherElement(
                                'Sunset',
                                selectedWeather.sunset + 'PM',
                                Icons.hourglass_empty_outlined,
                              ),
                            ),
                            Container(
                              child: WeatherElement(
                                'DayTime',
                                selectedWeather.dayTime,
                                Icons.hourglass_empty_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //margin: const EdgeInsets.only(left: 20.0),
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: 16),
                            EverydayWeather(),
                            EverydayWeather(),
                            EverydayWeather(),
                            EverydayWeather(),
                            EverydayWeather(),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                      //  SizedBox(height: 10),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                ))
              ],
            ),
          ),
          Visibility(
            child: LocationDrowdownList(refreshData, cities),
            visible: _isVisible,
          ),
        ],
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
