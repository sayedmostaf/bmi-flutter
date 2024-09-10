import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class AgeIndicator extends StatelessWidget {
  const AgeIndicator({super.key, required this.age});
  final int age;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
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
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Age',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
