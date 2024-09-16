import 'package:bmi/view/pages/records.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/pages/height.dart';
import 'package:bmi/view/widgets/age_picker.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:bmi/view/widgets/gender_picker.dart';
import 'package:bmi/view/widgets/weight_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('BMI Calculator'),
              forceElevated: innerIsScrolled,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const RecordPage();
                      }));
                    },
                    icon: const Icon(Icons.history)),
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
              height: 90,
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
            const SizedBox(
              height: 30,
            ),
          ],
        )),
      ),
    );
  }
}
