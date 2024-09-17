import 'package:bmi/view/pages/records.dart';
import 'package:bmi/view/pages/height.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/widgets/age_picker.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:bmi/view/widgets/gender_picker.dart';
import 'package:bmi/view/widgets/weight_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: swatch,
              title: const Text(
                'BMI Calculator',
                style: TextStyle(color: Colors.white),
              ),
              forceElevated: innerIsScrolled,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const RecordPage();
                      }));
                    },
                    icon: const Icon(
                      Icons.history,
                      color: Colors.white,
                    )),
              ],
            ),
          ];
        },
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GenderPicker(),
            const SizedBox(
              height: 100,
              child: AgePicker(),
            ),
            const WeightPicker(),
            const SizedBox(
              height: 20,
            ),
            CurvedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const HeightPage();
                }));
              },
            ),
            // const SizedBox(
            //   height: 30,
            // ),
          ],
        )),
      ),
    );
  }
}
