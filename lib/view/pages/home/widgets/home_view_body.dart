import 'package:flutter/material.dart';
import 'package:bmi/view/pages/home/widgets/home_view_gender_picker.dart';
import 'package:bmi/view/pages/home/widgets/home_view_age_picker.dart';
import 'package:bmi/view/pages/home/widgets/home_view_weight_picker.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GenderPicker(),
        SizedBox(
          height: 100,
          child: AgePicker(),
        ),
        WeightPicker(),
      ],
    );
  }
}
