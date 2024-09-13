import 'package:bmi/data/models/person.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  bool isMaleSelected = true;
  Person _person = Person();
  void selectGender() {
    isMaleSelected = !isMaleSelected;
    _person.gender = isMaleSelected ? "Male" : "Female";
    notifyListeners();
  }

  void resetValues() {
    isMaleSelected = true;
    _person = Person();
    notifyListeners();
  }

  void setPersonAge(int age) {
    _person.age = age;
  }

  void setPersonHeight(int height) {
    _person.height = height;
  }

  void setPersonWeight(int weight) {
    _person.weight = weight;
  }

  void calculatePersonBodyMassIndex() {}
  Person get getPerson => _person;
}
