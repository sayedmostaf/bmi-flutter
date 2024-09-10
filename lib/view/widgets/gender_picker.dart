import 'package:bmi/constants.dart';
import 'package:bmi/data/models/gender.dart';
import 'package:bmi/view/widgets/gender_selection_tile.dart';
import 'package:flutter/material.dart';

class GenderPicker extends StatefulWidget {
  const GenderPicker({super.key});

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  int selected = 0;
  List<Gender> genders = [
    Gender(
      gender: 'Male',
      image: 'male.gif',
      color: blue,
    ),
    Gender(
      gender: 'Female',
      image: 'female.gif',
      color: pink,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          int current = index;
          return GenderSelectionTile(
              gender: genders[index],
              isSelected: current == selected,
              onPressed: () {
                setState(() {
                  selected = index;
                });
              });
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: genders.length,
      ),
    );
  }
}
