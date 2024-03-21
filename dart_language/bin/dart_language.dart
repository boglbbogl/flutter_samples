//

void main() {}

class Hero {
  final int tier;
  const Hero({required this.tier});

  int getPower() => (10 - tier) * 100;
}

class IronMan extends Hero {
  const IronMan({super.tier = 9});
}

class Hulk extends Hero {
  const Hulk({super.tier = 7});
}
