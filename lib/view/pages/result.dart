import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/pages/home.dart';
import 'package:bmi/view/theme/typography.dart';
import 'package:bmi/view/widgets/composition_tile.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var person = Provider.of<PersonProvider>(context, listen: true).getPerson;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: swatch,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your ',
              style: TextStyle(
                color: Colors.white.withOpacity(.5),
              ),
            ),
            const Text(
              'Results',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.help),
            tooltip: 'Get Help',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 240,
                width: 240,
                decoration: decoratedBoxGradient,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'BMI',
                      style: CustomTypography.titleMedium,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      person.bodyMassIndex!.toStringAsFixed(2),
                      style: CustomTypography.bodyLarge,
                    ),
                    Text(
                      context.read<PersonProvider>().getStatus(),
                      style: CustomTypography.bodyMedium,
                    ),
                  ],
                ),
              ),
              Text(
                'Body Composition ',
                style: TextStyle(
                  color: Colors.white.withOpacity(.5),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    color: darkBlue,
                    child: Image.asset(person.gender == 'Male'
                        ? 'assets/normal_man.png'
                        : 'assets/normal_girl.png'),
                  ),
                  CompositionTile(
                    value: person.age.toString(),
                    title: "Age",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CompositionTile(
                    value: person.height.toString(),
                    title: "Centimeter",
                  ),
                  CompositionTile(
                    value: person.weight.toString(),
                    title: "Kg",
                  ),
                ],
              ),
              CurvedButton(
                text: 'Retry',
                icon: Icons.restore,
                onPressed: () {
                  Provider.of<PersonProvider>(context, listen: false)
                      .resetValues();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }), ((route) => false));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
