class Hero {
  String call(String name) => "Hero $name !";
  String callTest(String name) => "Test $name !";
}

void main() {
  Hero hero = Hero();
  String thor = hero("Thor");
  print(thor);
}
