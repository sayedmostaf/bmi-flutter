import 'package:bmi/data/models/person.dart';
import 'package:bmi/view/pages/result/widgets/composition_tile.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:flutter/material.dart';

class BodyCompositionRow extends StatelessWidget {
  final Person person;

  const BodyCompositionRow({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 120,
              color: darkBlue,
              child: Image.asset(person.gender == "Male"
                  ? "assets/images/normal_man.png"
                  : "assets/images/female.png"),
            ),
            CompositionTile(
              value: "${person.age}",
              title: "Age",
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CompositionTile(
              value: "${person.height}",
              title: "Centimeter",
            ),
            CompositionTile(
              value: "${person.weight}",
              title: "Kg",
            ),
          ],
        ),
      ],
    );
  }
}
