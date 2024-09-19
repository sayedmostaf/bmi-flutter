import 'package:bmi/data/models/person.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/theme/typography.dart';
import 'package:flutter/material.dart';

class RecordDetailsDialog extends StatelessWidget {
  final Person record;

  const RecordDetailsDialog({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          'Your Result',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: primary,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your BMI',
              style: CustomTypography.labelNormal,
            ),
            Text(
              record.bodyMassIndex!.toStringAsFixed(2),
              style: CustomTypography.bodyLarge,
            ),
            Text(
              '${record.height} cm',
              style: CustomTypography.bodyMedium,
            ),
            Text(
              '${record.weight} kg',
              style: CustomTypography.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
