import 'package:bmi/data/models/person.dart';
import 'package:bmi/utils/functions/get_status_bmi.dart';
import 'package:bmi/utils/functions/time_fromat.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:flutter/material.dart';

class SavedBmiTile extends StatelessWidget {
  const SavedBmiTile({super.key, required this.record});
  final Person record;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 76,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: record.gender! == 'Male' ? primary : pink,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              record.bodyMassIndex!.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.name!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${getStatus(record.bodyMassIndex!)} | ${record.age} on ${record.dataCreated!.format()}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
