import 'package:bmi/data/local/objectbox.g.dart';

class Person {
  int id = 0;
  int? height;
  int? age;
  int? weight;
  String? status;
  String? name;
  String? gender;
  double? bodyMassIndex;

  @Property(type: PropertyType.date)
  DateTime? dataCreated;

  Person() {
    age = 19;
    bodyMassIndex = 0;
    height = 173;
    weight = 82;
    gender = "Male";
    dataCreated = DateTime.now();
  }

}
