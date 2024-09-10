import 'package:flutter/material.dart';

class CircleShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(231.057, 48.922);
    path.lineTo(280.138, 221.138);
    path.lineTo(181.975, 221.138);
    path.lineTo(231.057, 48.922);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
