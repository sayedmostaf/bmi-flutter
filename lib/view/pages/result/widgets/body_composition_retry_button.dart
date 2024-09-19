import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/utils/navigation_helper.dart';
import 'package:bmi/view/pages/home/home_page.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  final PersonProvider provider;

  const RetryButton({required this.provider, super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedButton(
      text: "Retry",
      icon: Icons.restore,
      onPressed: () {
        provider.resetValues();
        navigateToPageAndRemoveUntil(context, const HomePage(), false);
      },
    );
  }
}
