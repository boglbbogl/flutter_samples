class GenralCount {
  int count = 0;
}

class SingletonCount {
  static final SingletonCount instance = SingletonCount._internal();
  factory SingletonCount() => instance;
  SingletonCount._internal();

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
}
