class Person {
  int? height;
  int? age;
  int? weight;
  String? name;
  String? gender;
  double? bodyMassIndex;

  Person(
      {this.age = 19,
      this.bodyMassIndex = 0,
      this.height = 170,
      this.name,
      this.weight = 82,
      this.gender});
}
