import 'package:bmi/controller/data_input_controller.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/data/models/gender.dart';
import 'package:bmi/view/widgets/gender_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          int old = selected;
          return GenderSelectionTile(
              gender: genders[index],
              isSelected: current == selected,
              onPressed: () {
                setState(() {
                  selected = current;
                  if (old != current) {
                    Provider.of<DataProvider>(context, listen: false)
                        .selectGender();
                  }
                  old = current;
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
