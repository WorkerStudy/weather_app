import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

import '../models/weather_model.dart';
import '../utilities/date_convert_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> forcastObject;

  const CityView({required this.forcastObject, super.key});

  @override
  Widget build(BuildContext context) {
    var date = forcastObject.data?.list?[0].dt;
    var city = forcastObject.data?.city?.name;
    var country = forcastObject.data?.city?.country;
    var nowDate = DateTime.fromMillisecondsSinceEpoch(date! * 1000);
    return Column(children: [
      Text(
        "$city, $country",
        style: Constants.boldStyle,
      ),
      Text(
        "${DateConvertUtil.getFormattedDate(nowDate)}",
        style: Constants.standartStyle,
      )
    ]);
  }
}
