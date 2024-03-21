//

// void main() {
//   Test test = Test();
//   test.hit();
// }

abstract class Person {
  void printName(String name);
}

class Tyger extends Person {
  @override
  void printName(String name) => print("이름은 Tyger !");
}
