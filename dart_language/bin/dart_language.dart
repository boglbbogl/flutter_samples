//

void main() {
  final G70 g70 = G70("G70");
  final G80 g80 = G80("G80");
  g70.printName();
  g80.printName();
}

class Car {
  final String name;

  const Car(this.name);

  void printName() => print("자동차 이름은 $name 입니다");
}

class G80 extends Car {
  const G80(super.name);
}

class G70 extends Car {
  const G70(super.name);

  // @override
  void printName() => print("$name 입니다");
}
