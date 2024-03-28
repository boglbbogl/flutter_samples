class GeneralPerson {}

class SingletonPerson {
  static final SingletonPerson instance = SingletonPerson._internal();
  factory SingletonPerson() => instance;
  SingletonPerson._internal();
}

void main() {
  GeneralPerson general1 = GeneralPerson();
  GeneralPerson general2 = GeneralPerson();
  print(general1.hashCode);
  print(general2.hashCode);
  print(general1 == general2);
  SingletonPerson singleton1 = SingletonPerson();
  SingletonPerson singleton2 = SingletonPerson();
  print(singleton1.hashCode);
  print(singleton2.hashCode);
  print(singleton1 == singleton2);
}
