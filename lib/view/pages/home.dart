import 'package:bmi/constants.dart';
import 'package:bmi/view/customs/age_indicator.dart';
import 'package:bmi/view/customs/gender_selection_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController agePickerController;
  int _selectedAge = 19;
  @override
  void initState() {
    super.initState();
    agePickerController =
        PageController(initialPage: _selectedAge, viewportFraction: 0.15);
    agePickerController.addListener(() {
      setState(() {
        _selectedAge = agePickerController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<int> ages = List<int>.generate(80, (index) => index);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: swatch,
        toolbarHeight: 100,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderSelectionTile(gender: 'Male'),
                GenderSelectionTile(gender: 'Female'),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
              height: 110,
              child: Flexible(
                child: PageView.builder(
                  controller: agePickerController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 80,
                  itemBuilder: (context, index) {
                    return index == _selectedAge
                        ? AgeIndicator(age: index + 1)
                        : Text(
                            '${index + 1}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
