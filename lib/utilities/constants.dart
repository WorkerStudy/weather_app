import 'package:flutter/material.dart';

class Constants {
  static const String WEATHER_APP_ID = "22f766bab4c8808d71387a2570f18432";
  static const String WEATHER_BASE_SCHEME = "https://";
  static const String WEATHER_BASE_URL_DOMAIN = "api.openweathermap.org";
  static const String WEATHER_FORECAST_PATH = "/data/2.5/forecast?";
  static const String WEATHER_IMAGES_PATH = "/img/w/";
  static const String WEATHER_IMAGES_URL =
      WEATHER_BASE_SCHEME + WEATHER_BASE_URL_DOMAIN + WEATHER_IMAGES_PATH;

  static const TextStyle standartStyle = TextStyle(fontSize: 24);
  static const TextStyle boldStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static getItem(IconData iconData, int value, String units) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 28,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '$value',
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          units,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        )
      ],
    );
  }
}
