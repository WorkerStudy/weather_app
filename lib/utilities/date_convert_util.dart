import 'dart:developer';

import 'package:intl/intl.dart';

import '../models/forecast_weather_days.dart';
import '../models/weather_model.dart';

class DateConvertUtil {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static List<ForecastWeatherDays> getForecastWeather(
      WeatherModel forecastObject) {
    List<ForecastWeatherDays> forecastList = <ForecastWeatherDays>[];

    List<DateTime> listDt = <DateTime>[];
    List<double> listTemp = <double>[];
    List<String> listWeatherType = <String>[];
    String weatherType = '';
    int codeTypeWeather = 900;
    DateTime dt =
        DateTime.fromMillisecondsSinceEpoch(forecastObject.list![0].dt! * 1000);

    for (int i = 0; i < forecastObject.list!.length; i++) {
      if (dt.day !=
          DateTime.fromMillisecondsSinceEpoch(
                  forecastObject.list![i].dt! * 1000)
              .day) {
        listTemp.sort();

        forecastList.add(ForecastWeatherDays(
            dt, listTemp.first, listTemp.last, weatherType));
        listTemp.clear();
        listDt.clear();
        weatherType = '';
        codeTypeWeather = 900;
        dt = DateTime.fromMillisecondsSinceEpoch(
            forecastObject.list![i].dt! * 1000);
      }

      listDt.add(DateTime.fromMillisecondsSinceEpoch(
          forecastObject.list![i].dt! * 1000));
      listTemp.add(forecastObject.list![i].main!.temp!);

      if (codeTypeWeather > forecastObject.list![i].weather![0].id!) {
        weatherType = forecastObject.list![i].weather![0].description!;
      }
    }
    forecastList.add(
        ForecastWeatherDays(dt, listTemp.first, listTemp.last, weatherType));
    print(forecastList.length);
    return forecastList;
  }
}
