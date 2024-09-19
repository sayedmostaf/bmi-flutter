import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/view/pages/home/widgets/home_view_age_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({super.key});

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  late PageController agePickerController;
  int _selectedAge = 19;
  @override
  void initState() {
    super.initState();
    agePickerController =
        PageController(initialPage: _selectedAge, viewportFraction: 0.14);
    agePickerController.addListener(() {
      setState(() {
        int position = agePickerController.page!.round();
        if (position != _selectedAge) {
          _selectedAge = position;
          trackAndSetPersonAge(context);
        }
      });
    });
  }

  void trackAndSetPersonAge(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false)
        .setPersonAge(_selectedAge);
  }

  @override
  void dispose() {
    agePickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: agePickerController,
      itemCount: 80,
      itemBuilder: (context, index) {
        bool isActive = _selectedAge == index;
        bool isNextLeftClose = index - _selectedAge == -1;
        bool isNextRightClose = index - _selectedAge == 1;
        bool isNextNextLeftClose = index - _selectedAge == -2;
        bool isNextNextRightClose = index - _selectedAge == 2;
        var text = Text("$index");

        return Align(
          alignment: Alignment.center,
          child: isActive
              ? AgeIndicator(age: index)
              : Text(
                  '${text.data}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(
                      isNextLeftClose || isNextRightClose
                          ? 0.8
                          : isNextNextLeftClose || isNextNextRightClose
                              ? .5
                              : .3,
                    ),
                    fontSize: isNextLeftClose || isNextRightClose
                        ? 24
                        : isNextNextLeftClose || isNextNextRightClose
                            ? 16
                            : 14,
                  ),
                ),
        );
      },
    );
  }
}
