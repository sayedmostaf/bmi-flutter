import 'package:flutter/material.dart';

class CustomCurvePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width, height = size.height;
    Path customPath = Path();
    customPath.moveTo(0, size.height * 0.0016667);
    customPath.lineTo(width * 0.9975000, height * 0.0033333);
    customPath.lineTo(width * 0.9991667, height * 0.9150000);
    customPath.lineTo(width * 0.0016667, height * 0.9983333);
    customPath.lineTo(0, height * 0.0016667);
    customPath.close();
    return customPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
