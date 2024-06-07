class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}

class Person {
  String? name;
  void changedName(String name) => this.name = name;
}
