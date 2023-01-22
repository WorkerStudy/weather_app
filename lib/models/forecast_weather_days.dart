import 'package:weather_app/models/weather_model.dart';

///Прогноз на день
class ForecastWeatherDays {
  DateTime dt;
  double temp_min, temp_max;
  String weather;

  ForecastWeatherDays(this.dt, this.temp_min, this.temp_max, this.weather);
}
