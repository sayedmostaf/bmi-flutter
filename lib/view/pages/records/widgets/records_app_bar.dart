import 'package:bmi/main.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:flutter/material.dart';

class RecordsAppBar extends StatelessWidget {
  const RecordsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: swatch,
      centerTitle: true,
      forceElevated: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your ",
            style: TextStyle(color: Colors.white.withOpacity(.5)),
          ),
          const Text(
            "Records",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            localStorage.removeAll();
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          tooltip: "Delete All Records",
        ),
      ],
    );
  }
}
