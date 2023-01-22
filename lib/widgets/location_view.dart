import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
//import 'package:weather_app/providers/geo_location_provider.dart';

import '../models/weather_model.dart';

class LocationView extends StatelessWidget {
  AsyncSnapshot<WeatherModel>? forecastObject;
  String? city;
  bool geoLocation = true;
  LocationView(
      {required this.geoLocation, required this.forecastObject, super.key}) {
    city = forecastObject!.data!.city!.name!;
  }

  LocationView.fromLoad(
      {required String newCity, required this.geoLocation, super.key}) {
    city = newCity;
    geoLocation = false;
  }

  @override
  Widget build(BuildContext context) {
    //String country = forecastObject.data!.city!.country!;
    //var description = forecastList![0].weather![0].description;

    //   Provider.of<GeoLocationProvider>(context, listen: false).geoLocation;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(90, 255, 255, 255),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.locationDot,
                    size: 16,
                    color: geoLocation ? Colors.greenAccent : Colors.white),
                Text(
                  " $city",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
