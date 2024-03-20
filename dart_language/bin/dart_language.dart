//

void main() {
  G70 g70 = G70("G70");
  g70.getHorsePower(100);
  print(g70.name);
}

class Car {
  final String name;
  const Car(this.name);
  void getHorsePower(int hp) => print("마력은 $hp 입니다.");
}

class G70 implements Car {
  @override
  String get name => throw UnimplementedError();
  @override
  void getHorsePower(int hp) {}
}
