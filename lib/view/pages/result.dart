import 'package:bmi/constants.dart';
import 'package:bmi/view/pages/home.dart';
import 'package:bmi/view/widgets/curved_button.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
              const CircleAvatar(
                radius: 130,
                backgroundColor: primary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    color: Colors.red,
                  ),
                  Container(
                    width: 150,
                    height: 120,
                    color: Colors.red,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    color: Colors.red,
                  ),
                  Container(
                    width: 150,
                    height: 120,
                    color: Colors.red,
                  ),
                ],
              ),
              CurvedButton(
                text: 'Retry',
                icon: Icons.restore,
                onPressed: () {
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
