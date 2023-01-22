import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/forecast_weather_days.dart';
import 'package:weather_app/utilities/load_icon_weather.dart';

///Показывает прогноз на следующий день
Widget ForecastCardDay(
    List<ForecastWeatherDays> listForecast, int index, BuildContext context) {
  Intl.defaultLocale = "ru";
  initializeDateFormatting('ru');
  DateTime date = listForecast[index].dt;
  var fullDate = DateFormat('EEEEE').format(date);
  var dayOfWeek = fullDate.split(',')[0];
  dayOfWeek =
      "${dayOfWeek[0].toUpperCase()}${dayOfWeek.substring(1).toLowerCase()}";
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          dayOfWeek,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        Text(
          '${date.day}/${date.month}',
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ]),
      Row(
        children: [
          SizedBox(
              height: 30, child: LoadIconWeather(listForecast[index].weather)),
          Container(
            width: 100,
            child: Text(
              '${listForecast[index].temp_min.round()}°/${listForecast[index].temp_max.round()}°',
              textAlign: TextAlign.end,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      )
    ],
  );
}
