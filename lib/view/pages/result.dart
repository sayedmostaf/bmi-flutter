import 'package:bmi/main.dart';
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
    var provider = Provider.of<PersonProvider>(context, listen: true);
    var person = provider.getPerson;
    TextEditingController nameController = TextEditingController();
    var key = GlobalKey<FormState>();

    showSaveDialog() {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Center(
              child: Text('Save'),
            ),
            content: SizedBox(
              child: Form(
                  key: key,
                  child: TextFormField(
                    validator: (str) {
                      return str!.isEmpty ? "Name is Missing" : null;
                    },
                    controller: nameController,
                    cursorColor: primary,
                    decoration: const InputDecoration(
                        hintText: "Enter Your Name",
                        filled: true,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: primary))),
                  )),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      provider.setPersonName(nameController.text);
                      localStorage.savedRecord(person);
                      provider.resetValues();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: primary),
                  )),
            ],
          );
        }),
      );
    }

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
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          children: [
            Column(
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
                SizedBox(
                  height: size.height * .04,
                ),
                Text(
                  'Body Composition ',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                  ),
                ),
                SizedBox(
                  height: size.height * .04,
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
                SizedBox(
                  height: size.height * .02,
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
                SizedBox(
                  height: size.height * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    SizedBox(
                      width: size.width * .05,
                    ),
                    CurvedButton(
                      text: 'Save',
                      icon: Icons.save,
                      color: Colors.green,
                      onPressed: showSaveDialog,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
