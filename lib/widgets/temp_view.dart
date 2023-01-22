// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utilities/load_icon_weather.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> forecastObject;

  const TempView({required this.forecastObject, super.key});

  @override
  Widget build(BuildContext context) {
    var forecastList = forecastObject.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].main!.temp!.toStringAsFixed(0);
    var tempMin = forecastList[0].main!.tempMin!.toStringAsFixed(0);
    var tempMax = forecastList[0].main!.tempMax!.toStringAsFixed(0);
    //String city = forecastObject.data!.city!.name!;
    //String country = forecastObject.data!.city!.country!;
    var description = forecastList[0].weather![0].description!;

    return SizedBox(
      height: 240,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      '$temp°',
                      style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      '${tempMin}°/${tempMax}°    ',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(164, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child:
                    SizedBox(width: 350, child: LoadIconWeather(description)),
              )

              // Image.network(
              //    icon,
              //   scale: 0.3,
              //  ),
            ],
          ),
        ],
      ),
    );
  }
}
