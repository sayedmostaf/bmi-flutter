import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/controller/data_input_controller.dart';
import 'package:bmi/view/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => DataProvider(),
      ),
    ],
    child: const BMI(),
  ));
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
      home: const HomePage(),
    );
  }
}
