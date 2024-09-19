import 'package:bmi/data/models/person.dart';
import 'package:bmi/utils/functions/get_status_bmi.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/theme/typography.dart';
import 'package:flutter/material.dart';

class BMIDisplayContainer extends StatelessWidget {
  final Person person;

  const BMIDisplayContainer({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 240,
      decoration: decoratedBoxGradient,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "BMI",
            style: CustomTypography.titleMedium,
          ),
          const SizedBox(height: 15),
          Text(
            person.bodyMassIndex!.toStringAsFixed(2),
            style: CustomTypography.bodyLarge,
          ),
          Text(
            getStatus(person.bodyMassIndex!),
            style: CustomTypography.bodyMedium,
          )
        ],
      ),
    );
  }
}
