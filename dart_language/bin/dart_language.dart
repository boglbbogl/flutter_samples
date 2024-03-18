//

void main() {
  // G70 g70 = G70(subName: "Sedan");
  // g70.getHorsePower();
  Tyger tyger = Tyger();
  tyger.log();
}

class Car {
  final int hp;
  final String name;

  const Car({this.name = "", this.hp = 0});

  void getHorsePower() => print("$name 마력 : $hp");
}

class G80 extends Car {
  const G80({super.name = "G80", super.hp = 250});
}

class G70 extends Car {
  final String subName;
  const G70({
    super.name = "G70",
    super.hp = 230,
    required this.subName,
  });
}

class Person {
  final String name = "Empty";
}

class Tyger extends Person {
  final String name = "Tyger";

  void log() => print("Person name: ${super.name}, Tyger name: ${this.name}");
}

// class ParentClass {
//   String shot = "This is a shot on Super Keyword";
// }

// // Creating child class
// class SubClass extends ParentClass {
//   final String shot = "Educative";
//   // Accessing parent class variable
//   void showMessage() {
//     print(super.shot);

//     print("$shot has ${shot.length} letters.");
//   }
// }
