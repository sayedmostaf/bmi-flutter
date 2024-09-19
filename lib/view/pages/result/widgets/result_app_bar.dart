import 'package:bmi/view/theme/colors.dart';
import 'package:flutter/material.dart';

class ResultAppBar extends StatelessWidget {
  const ResultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      backgroundColor: swatch,
      forceElevated: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your ",
            style: TextStyle(
              color: Colors.white.withOpacity(.5),
            ),
          ),
          const Text(
            "Results",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
