import 'package:bmi/app.dart';
import 'package:bmi/controllers/objectbox.dart';
import 'package:bmi/providers/person_provider.dart';
import 'package:flutter/material.dart';
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
