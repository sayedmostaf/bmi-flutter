import 'package:bmi/data/models/person.dart';
import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/view/pages/result/widgets/body_composition_retry_button.dart';
import 'package:bmi/view/pages/result/widgets/body_composition_save_button.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final Size size;
  final PersonProvider provider;
  final Person person;

  const ActionButtons({
    required this.size,
    required this.provider,
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RetryButton(provider: provider),
        SizedBox(width: size.width * .05),
        SaveButton(provider: provider, person: person),
      ],
    );
  }
}