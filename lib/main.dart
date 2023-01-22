import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
//import 'package:weather_app/providers/geo_location_provider.dart';
import 'screens/screen_weather_forecast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: ScreenWeatherForecast(),
    );
  }
}
