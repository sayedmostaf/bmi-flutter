import 'package:bmi/view/theme/typography.dart';
import 'package:flutter/material.dart';

class NoRecordsFoundWidget extends StatelessWidget {
  const NoRecordsFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/list.gif'),
        Text(
          'No Records Found!',
          textAlign: TextAlign.center,
          style: CustomTypography.bodyMedium,
        ),
      ],
    );
  }
}
