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

  factory Platform.subClass() => Mac(
        id: 0,
        code: null,
        name: "",
        os: "",
        createdAt: "",
        updatedAt: null,
      );
}

class Mac extends Platform {
  const Mac({
    required super.id,
    required super.code,
    required super.name,
    required super.os,
    required super.createdAt,
    required super.updatedAt,
  });
}

class Test {
  final int _test;

  const Test({required int test}) : _test = test;
}

class Test2 extends Test {
  const Test2({required super.test});
}

void main() {
  Test2 test = Test2(test: 0);
  print(test._test);
}
