import 'package:bmi/data/models/person.dart';

double calculatePersonBodyMassIndex(Person person) {
  double height = person.height! / 100;
  int weight = person.weight!;

  return weight / (height * height);
}
