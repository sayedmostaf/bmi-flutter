import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/pages/height.dart';
import 'package:bmi/view/widgets/age_picker.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:bmi/view/widgets/gender_picker.dart';
import 'package:bmi/view/widgets/weight_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: swatch,
        toolbarHeight: 80,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GenderPicker(),
            const SizedBox(
              height: 100,
              child: AgePicker(),
            ),
            const SizedBox(
              height: 18,
            ),
            const WeightPicker(),
            const SizedBox(
              height: 20,
            ),
            CurvedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return const HeightPage();
                })));
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
