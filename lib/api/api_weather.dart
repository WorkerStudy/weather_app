import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/location.dart';

class ApiWeather {
  Future<WeatherModel> fetchWeatherForecast(
      String? nameCity, bool geoLocation) async {
    Map<String, dynamic> queryParam = {};
    log("request: ${Constants.WEATHER_BASE_SCHEME}${Constants.WEATHER_BASE_URL_DOMAIN}${Constants.WEATHER_FORECAST_PATH}");

    try {
      if (!geoLocation) {
        queryParam['q'] = nameCity;
      } else {
        Location locationUser = Location();
        await locationUser.getCurrentLocation();
        queryParam['lat'] = locationUser.latitude;
        queryParam['lon'] = locationUser.longitude;
      }

      queryParam.addAll({
        "lang": "ru",
        "units": "metric",
        "apikey": Constants.WEATHER_APP_ID,
      });

      Response response = await Dio().get(
          Constants.WEATHER_BASE_SCHEME +
              Constants.WEATHER_BASE_URL_DOMAIN +
              Constants.WEATHER_FORECAST_PATH,
          queryParameters: queryParam);

      log("response: $response");

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      }
      throw Exception("Не удалось получить прогноз");
    } on DioError catch (_, e) {
      throw Exception('Не удалось получить прогноз \n ${_.error}');
      // response.statusCode
    }
  }

  //Future<>
}
