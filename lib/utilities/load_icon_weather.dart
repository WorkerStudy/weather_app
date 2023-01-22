import 'package:flutter/material.dart';

Widget LoadIconWeather(String forecast) {
  String pathIcon = '';
  switch (forecast.toLowerCase()) {
    case 'ясно':
      pathIcon = "assets/Солнце.png";
      break;
    case 'небольшой снег':
      pathIcon = "assets/снег.png";
      break;
    case 'облачно с прояснениями':
      pathIcon = 'assets/ОблачноДень.png';
      break;
    case 'переменная облачность':
      pathIcon = 'assets/ОблачноДень.png';
      break;
    case 'небольшая облачность':
      pathIcon = 'assets/ОблачноДень.png';
      break;
    case 'пасмурно':
      pathIcon = 'assets/пасмурно.png';
      break;
    case 'снег':
      pathIcon = 'assets/снег.png';
      break;
    default:
      print(forecast);
      pathIcon = "assets/Ночь.png";
  }

  return Image.asset(pathIcon);
}
