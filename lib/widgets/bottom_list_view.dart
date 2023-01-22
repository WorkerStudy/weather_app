import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_weather_days.dart';
import 'package:weather_app/utilities/date_convert_util.dart';
import '../models/weather_model.dart';
import 'forecast_card_day.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> forecastObject;
  const BottomListView({required this.forecastObject, super.key});

  @override
  Widget build(BuildContext context) {
    List<ForecastWeatherDays> listForecast =
        DateConvertUtil.getForecastWeather(forecastObject.data!);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Прогноз на ${listForecast.length.toString()} дней'.toUpperCase(),
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Container(
            height: 340,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView.separated(
              // scrollDirection: Axis.values,
              shrinkWrap: false,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: listForecast.length,
              itemBuilder: (context, index) => Container(
                width: 160,
                height: 45,
                //color: Colors.pink,
                child: ForecastCardDay(listForecast, index, context),
              ),
            ))
      ],
    );
  }
}
