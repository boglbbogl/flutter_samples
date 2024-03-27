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

class Platform {
  final int id;
  final String? code;
  final String name;
  final String os;
  final String createdAt;
  final String? updatedAt;

  const Platform({
    required this.id,
    required this.code,
    required this.name,
    required this.os,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Platform.empty() => Platform(
        id: 0,
        code: null,
        name: "",
        os: "",
        createdAt: "",
        updatedAt: null,
      );
}
