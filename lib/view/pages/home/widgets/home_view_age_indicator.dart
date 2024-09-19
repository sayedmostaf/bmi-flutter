import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/theme/typography.dart';
import 'package:flutter/material.dart';

class AgeIndicator extends StatelessWidget {
  const AgeIndicator({super.key, required this.age});
  final int age;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 55,
          // alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 25,
                height: 5,
                decoration: BoxDecoration(
                    color: darkBlue, borderRadius: BorderRadius.circular(10)),
              ),
              Text(
                '$age',
                style: CustomTypography.labelLarge,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Age',
          style: CustomTypography.labelNormal,
        ),
      ],
    );
  }
}
