import 'package:flutter/material.dart';

import '../screens/home_page.dart';
import 'data/weather.dart';
import 'data/cities.dart';

void main() {
  runApp(MyApp());
}

List<Cities> cities = [];
List<WeatherData> weatherData = [];
dummyDataInit() {
  cities = [];
  weatherData = [];
  cities.add(Cities('Bishkek', 'Kyrgyzstan', '30'));
  cities.add(Cities('Almaty', 'Kazakhstan', '20'));
  cities.add(Cities('Miami', 'US', '26'));
  cities.add(Cities('Milwaukee', 'US', '7'));
  cities.add(Cities('Mumbai', 'India', '33'));
  cities.add(Cities('Munich', 'Germany', '11'));

  weatherData.add(
    WeatherData(
      'Bishkek',
      'Sunny',
      '30',
      '28',
      '20',
      '60',
      '705',
      '20',
      '6:05',
      '9:15',
      '15h10m',
    ),
  );
  weatherData.add(
    WeatherData(
      'Almaty',
      'Cloudy',
      '20',
      '24',
      '15',
      '55',
      '690',
      '25',
      '6:10',
      '9:15',
      '15h05m',
    ),
  );
  weatherData.add(
    WeatherData(
      'Miami',
      'Sunny',
      '26',
      '28',
      '20',
      '60',
      '705',
      '20',
      '6:05',
      '9:15',
      '15:10',
    ),
  );
  weatherData.add(
    WeatherData(
      'Milwaukee',
      'Sunny',
      '7',
      '28',
      '20',
      '60',
      '705',
      '20',
      '6:05',
      '9:15',
      '15:10',
    ),
  );
  weatherData.add(
    WeatherData(
      'Mumbai',
      'Sunny',
      '33',
      '28',
      '20',
      '60',
      '705',
      '20',
      '6:05',
      '9:15',
      '15:10',
    ),
  );
  weatherData.add(
    WeatherData(
      'Munich',
      'Sunny',
      '11',
      '28',
      '20',
      '60',
      '705',
      '20',
      '6:05',
      '9:15',
      '15:10',
    ),
  );
  cities.sort((a, b) => a.city.compareTo(b.city));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dummyDataInit();
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Barlow-Medium',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          )),
      home: WeatherHomePage(cities, weatherData),
    );
  }
}
