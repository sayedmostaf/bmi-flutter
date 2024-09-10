import 'package:flutter/material.dart';

MaterialColor getMaterialColor(Color color) {
  List lenghts = <double>[0.05];
  Map<int, Color> swatch = {};
  final int red = color.red, green = color.green, blue = color.blue;
  for (int i = 1; i < 10; i++) {
    lenghts.add(i * 0.1);
  }
  for (var len in lenghts) {
    final double dx = 0.5 - len;
    swatch[(len * 1000).round()] = Color.fromRGBO(
        red + ((dx < 0 ? red : (255 - red)) * dx).round(),
        green + ((dx < 0 ? green : (255 - green)) * dx).round(),
        blue + ((dx < 0 ? blue : (255 - blue)) * dx).round(),
        1);
  }
  return MaterialColor(color.value, swatch);
}

const Color swatch = Color.fromRGBO(54, 52, 80, 1);
const Color primary = Color.fromRGBO(111, 103, 228, 1);
const Color darkBlue = Color.fromRGBO(32, 33, 55, 1);
const Color grey = Color.fromRGBO(69, 68, 95, 1);
const Color blue = Color.fromRGBO(117, 158, 242, 1);
const Color pink = Color.fromRGBO(204, 154, 240, 1);
