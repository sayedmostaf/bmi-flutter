import 'package:bmi/utils/navigation_helper.dart';
import 'package:bmi/view/pages/height/height_page.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:flutter/material.dart';

class HomeViewActionButton extends StatelessWidget {
  const HomeViewActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedButton(
      onPressed: () {
        navigateToPage(context, const HeightPage());
      },
    );
  }
}
