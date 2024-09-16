import 'package:bmi/controllers/objectbox.dart';
import 'package:bmi/providers/person_provider.dart';
import 'package:bmi/view/theme/colors.dart';
import 'package:bmi/view/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

late ObjectBox localStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  localStorage = await ObjectBox.create();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => PersonProvider(),
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
