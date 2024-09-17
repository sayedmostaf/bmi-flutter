import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/view/widgets/pentagon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late PageController weightPickerController;
  int _selectedWeight = 82;
  @override
  void initState() {
    super.initState();

    weightPickerController =
        PageController(initialPage: _selectedWeight, viewportFraction: .14);

    weightPickerController.addListener(() {
      setState(() {
        int position = weightPickerController.page!.round();
        if (position != _selectedWeight) {
          _selectedWeight = position;
          trackAndSetWeight(context);
        }
      });
    });
  }

  void trackAndSetWeight(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false)
        .setPersonWeight(_selectedWeight);
  }

  @override
  void dispose() {
    weightPickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CustomPentagon(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Container(
          height: size.height * .4,
          width: size.width * .9,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              border: Border.all(color: darkBlue, width: 2),
              color: primary,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              SizedBox(
                height: 80,
                child: PageView.builder(
                  controller: weightPickerController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    bool isActive = _selectedWeight == index;
                    bool isNextLeftClose = index - _selectedWeight == -1;
                    bool isNextRightClose = index - _selectedWeight == 1;
                    bool isNextNextLeftClose = index - _selectedWeight == -2;
                    bool isNextNextRightClose = index - _selectedWeight == 2;
                    var text = Text("$index");
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${text.data}",
                        style: TextStyle(
                            fontWeight: isActive ? FontWeight.normal : null,
                            color: Colors.white.withOpacity(isActive
                                ? 1
                                : isNextLeftClose || isNextRightClose
                                    ? .8
                                    : isNextNextLeftClose ||
                                            isNextNextRightClose
                                        ? .5
                                        : .3),
                            fontSize: isActive
                                ? 36
                                : isNextLeftClose || isNextRightClose
                                    ? 25
                                    : isNextNextLeftClose ||
                                            isNextNextRightClose
                                        ? 18
                                        : 16),
                      ),
                    );
                  },
                ),
              ),
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$_selectedWeight",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: primary,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Kg",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
