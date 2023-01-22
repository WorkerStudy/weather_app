import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/api/api_weather.dart';
import 'package:weather_app/models/users_data_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utilities/load_data_util.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/location_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

import '../utilities/night_day_gradient.dart';

class ScreenWeatherForecast extends StatefulWidget {
  const ScreenWeatherForecast({super.key});

  @override
  State<ScreenWeatherForecast> createState() => _ScreenWeatherForecastState();
}

class _ScreenWeatherForecastState extends State<ScreenWeatherForecast> {
  Future<WeatherModel>? forecastObject;
  //double lat = 54.989347, lon = 73.368221;
  //double lat = 55.755864, lon = 37.617698;
  String cityName = 'Омск';
  bool geoPosition = false;

  @override
  void initState() {
    super.initState();
    LocationPermission permission;
    forecastObject = ApiWeather().fetchWeatherForecast(cityName, geoPosition);
    forecastObject!.then((value) => print(value.list![0].weather![0].main));
    //LoadDataUtil()
    //    .saveDataUser(UsersDataModel(geoPosition: true, cityName: cityName));
    //LoadDataUtil().loadDataUser().then((value) => print(value.cityName));
  }

  Future<String?> dialog(BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          String newCityName = '';
          return AlertDialog(
            title: const Text('Выберите вариант поиска прогноза'),
            content: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                  initialValue: cityName,
                  // controller: TextEditingController(),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      hintText: 'Введите название города'),
                  onChanged: (value) {
                    newCityName = value;
                  }),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    geoPosition = true;
                    return Navigator.pop(context, 'Geo');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(FontAwesomeIcons.locationDot),
                      const Text('Использовать \n геопозицию'),
                    ],
                  )),
              TextButton(
                onPressed: () {
                  if (newCityName.isEmpty) {
                    return;
                  }
                  geoPosition = false;
                  cityName = newCityName;
                  return Navigator.pop(context, 'City');
                },
                child: const Text('Выбрать город'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: NightDayGradient(),
        ))),
        FutureBuilder<WeatherModel>(
          future: forecastObject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              cityName = snapshot.data!.city!.name!;
              return ListView(children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: TempView(forecastObject: snapshot),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    String? answer = await dialog(context);
                    forecastObject = ApiWeather()
                        .fetchWeatherForecast(cityName, geoPosition);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: LocationView(
                        geoLocation: geoPosition, forecastObject: snapshot),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                DetailView(forecastObject: snapshot),
                const SizedBox(
                  height: 50,
                ),
                BottomListView(
                  forecastObject: snapshot,
                ),
              ]);
            }
            if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.error.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: geoPosition
                          ? const Icon(FontAwesomeIcons.mapLocationDot)
                          : GestureDetector(
                              onTap: () async {
                                String? answer = await dialog(context);
                                forecastObject = ApiWeather()
                                    .fetchWeatherForecast(
                                        cityName, geoPosition);
                                setState(() {});
                              },
                              child: LocationView.fromLoad(
                                  newCity: cityName, geoLocation: false),
                            ),
                    ),
                  ),
                ],
              );
            }

            return Column(mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Загрузка данных",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: geoPosition
                          ? const Icon(FontAwesomeIcons.mapLocationDot)
                          : LocationView.fromLoad(
                              newCity: cityName, geoLocation: false),
                    ),
                  ),
                  const CircularProgressIndicator(
                    color: Colors.orange,
                  )
                ]);
          },
        )
      ]),
    );
  }
}
