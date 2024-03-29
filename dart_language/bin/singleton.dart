// class GenralCount {
//   int count = 0;
// }

class SingletonCount {
  static final SingletonCount instance = SingletonCount.test();
  factory SingletonCount() => instance;
  SingletonCount.test();

  int count = 0;
}

void main() {
  // GenralCount count1 = GenralCount();
  // GenralCount count2 = GenralCount();
  // count1.count = count1.count + 1;
  // print(count1.count);
  // print(count2.count);

  SingletonCount count1 = SingletonCount();
  SingletonCount count2 = SingletonCount();
  count1.count = count1.count + 1;
  print(count1.count);
  print(count2.count);
  print(count1.hashCode);
  print(count2.hashCode);

  // Singleton test = Singleton.instance;
  // Singleton test2 = Singleton.instance;
  // print(test.hashCode);
  // print(test2.hashCode);
}

class Singleton {
  static final Singleton _instance = Singleton._internal();
  factory Singleton() => _instance;
  Singleton._internal();
}
