import 'package:bmi/view/pages/records/records_page.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: swatch,
      title: const Text(
        'BMI Calculator',
        style: TextStyle(color: Colors.white),
      ),
      // forceElevated: innerIsScrolled,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const RecordPage();
            }));
          },
          icon: const Icon(
            Icons.history,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
