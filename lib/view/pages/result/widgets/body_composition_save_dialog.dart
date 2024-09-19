import 'package:bmi/data/models/person.dart';
import 'package:bmi/main.dart';
import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/utils/navigation_helper.dart';
import 'package:bmi/view/pages/home/home_page.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaveDialog extends StatelessWidget {
  final PersonProvider provider;
  final Person person;

  const SaveDialog({
    required this.provider,
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    var key = GlobalKey<FormState>();

    return AlertDialog(
      backgroundColor: primary,
      title: const Center(
        child: Text(
          'Save Record',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      content: SizedBox(
        child: Form(
          key: key,
          child: TextFormField(
            validator: (str) => str!.isEmpty ? "Name is Missing" : null,
            controller: nameController,
            cursorColor: primary,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              fillColor: swatch,
              hintText: "Enter Your Name",
              hintStyle: TextStyle(color: Colors.white),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: swatch,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (key.currentState!.validate()) {
              provider.setPersonName(nameController.text);
              localStorage.savedRecord(person);
              provider.resetValues();
              navigateToPageAndRemoveUntil(context, const HomePage(), false);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: swatch,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Confirm',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
