import 'package:bmi/view/theme/colors.dart';
import 'package:flutter/material.dart';

class HeightViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeightViewAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: swatch,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select Your ",
            style: TextStyle(
              color: Colors.white.withOpacity(.5),
            ),
          ),
          const Text(
            "Height",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
