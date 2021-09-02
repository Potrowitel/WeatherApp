import 'package:flutter/foundation.dart';

class WeatherData {
  final String city;
  final String weather;
  final String temp;
  final String tempH;
  final String tempL;
  final String humidity;
  final String pressure;
  final String wind;
  final String sunrise;
  final String sunset;
  final String dayTime;

  WeatherData(
    this.city,
    this.weather,
    this.temp,
    this.tempH,
    this.tempL,
    this.humidity,
    this.pressure,
    this.wind,
    this.sunrise,
    this.sunset,
    this.dayTime,
  );
}
