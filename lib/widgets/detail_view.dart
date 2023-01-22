import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/weather_model.dart';
import '../utilities/constants.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> forecastObject;
  const DetailView({required this.forecastObject, super.key});

  @override
  Widget build(BuildContext context) {
    var forecastList = forecastObject.data?.list;
    var pressure = forecastList![0].main!.pressure! * 0.7500062;
    var humidity = forecastList![0].main!.humidity!;
    var wind = forecastList[0].wind!.speed;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Constants.getItem(FontAwesomeIcons.temperatureThreeQuarters,
            pressure.round(), 'mm Hg'),
        Constants.getItem(FontAwesomeIcons.droplet, humidity, '%'),
        Constants.getItem(FontAwesomeIcons.wind, wind!.toInt(), "м/с"),
      ],
    );
  }
}
