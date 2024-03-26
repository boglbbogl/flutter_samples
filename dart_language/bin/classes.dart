class Person {
  final String name;
  final int age = 10;

  const Person(this.name);

  const Person.init(this.name);
}

class Hero {
  static void fly() {}

  void printPower() => print("Power");

  int getAttack() => 100;
}

abstract class Car {
  void getHorsePower();
  void getTorque();
  void getCurbWeight();
}
