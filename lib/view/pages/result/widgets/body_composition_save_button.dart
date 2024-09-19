import 'package:bmi/data/models/person.dart';
import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/view/pages/result/widgets/body_composition_save_dialog.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final PersonProvider provider;
  final Person person;

  const SaveButton({
    required this.provider,
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedButton(
      text: "Save",
      icon: Icons.save,
      color: Colors.green,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return SaveDialog(provider: provider, person: person);
          },
        );
      },
    );
  }
}