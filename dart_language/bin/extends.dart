abstract class Car {
  final String name;

  const Car({required this.name});

  void printCar();
}

class EngineCar extends Car {
  const EngineCar({required super.name});

  @override
  void printCar() => print("내연기관 차에요 !");
}

class EcoCar extends Car {
  const EcoCar({required super.name});
  @override
  void printCar() => print("친환경 차에요 !");
}

class Hybrid extends EcoCar {
  const Hybrid({required super.name});
  void printHybrid() => print("동력은 전기에요 !");
}

class Electric extends EcoCar {
  const Electric({required super.name});
  void printElectric() => print("동력은 전기에요 !");
}

class Engine extends EngineCar {
  const Engine({required super.name});
  void printEngine() => print("동력은 엔진이에요 !");
}

class Panamera extends Hybrid {
  const Panamera({required super.name});
}

class Taycan extends Electric {
  Taycan({required super.name});
}

class Boxter extends Engine {
  const Boxter({required super.name});
}
