import 'package:flutter/material.dart';

List<Color> NightDayGradient() {
  return DateTime.now().hour > 6 && DateTime.now().hour < 18
      ? [
          const Color.fromRGBO(52, 211, 247, 1),
          const Color.fromRGBO(1, 93, 218, 1)
        ]
      : [
          const Color.fromRGBO(68, 3, 157, 1),
          const Color.fromRGBO(3, 8, 46, 1)
        ];
}
