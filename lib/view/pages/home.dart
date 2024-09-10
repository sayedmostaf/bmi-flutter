import 'package:bmi/constants.dart';
import 'package:bmi/view/widgets/age_picker.dart';
import 'package:bmi/view/widgets/gender_selection_tile.dart';
import 'package:bmi/view/widgets/weight_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<int> ages = List<int>.generate(80, (index) => index);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: swatch,
        toolbarHeight: 100,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderSelectionTile(gender: 'Male'),
                GenderSelectionTile(gender: 'Female'),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 100,
              child: AgePicker(),
            ),
            SizedBox(
              height: 24,
            ),
            WeightPicker(),
          ],
        ),
      ),
    );
  }
}
