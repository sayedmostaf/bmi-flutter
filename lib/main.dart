import 'package:bmi/constants.dart';
import 'package:bmi/view/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: getMaterialColor(swatch),
        scaffoldBackgroundColor: swatch,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          toolbarHeight: 100,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: swatch,
          ),
        ),
      ),
      home: const HomePage(
        title: 'BMI Calculator',
      ),
    );
  }
}
