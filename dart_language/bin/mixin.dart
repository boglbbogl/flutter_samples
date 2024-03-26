abstract class ElectricCar {}

abstract class EngineCar {}

abstract class HybridCar {}

mixin Electric {}

mixin Engine {}

mixin Fuel on Engine {}

mixin Gasoline on Engine, Fuel {}

mixin Diesel on Engine, Fuel {}

mixin Battery on Electric {}

mixin Charger on Electric, Battery {}

mixin DPF on Engine, Fuel, Diesel {}

class Boxter extends EngineCar with Engine, Fuel, Gasoline {}

class Taycan extends ElectricCar with Electric, Battery, Charger {}

class Cayenne extends EngineCar with Engine, Fuel, Diesel, DPF {}

class PanameraHybrid extends HybridCar
    with Engine, Electric, Fuel, Gasoline, Battery, Charger {}

// abstract class Hero {
//   final String name;
//   const Hero(this.name);
// }

// mixin Fly on Hero {
//   void fly() => print("${super.name} Fly !");
// }

// mixin Punch on Hero {
//   void punch() => print("${super.name} Punch !");
// }

// mixin Kick on Hero {
//   void kick() => print("${super.name} Kick !");
// }

// mixin Bim on Hero {
//   void beam() => print("${super.name} Laser Bim !");
// }

// class IronMan extends Hero with Fly, Punch, Kick, Bim {
//   IronMan() : super("IronMan");
// }

// class BatMan extends Hero with Punch, Kick {
//   const BatMan() : super("BatMan");
// }

// class SuperMan extends Hero with Fly, Punch, Kick, Bim {
//   SuperMan() : super("SuperMan");
// }

abstract class Phone {
  String get name;
}

abstract class PC {
  String get name;
}

mixin Photo {
  void openPhotos() => print("사진첩 오픈 !");
}
mixin Lock {
  void unLock() => print("잠금 해제 !");
}

mixin Camera on Phone {
  void takePicture() => print("$name 사진 촬영 !");
}

class IPhone extends Phone with Photo, Lock, Camera {
  @override
  String get name => "iPhone 15";
}

class Macbook extends PC with Photo, Lock {
  @override
  String get name => "Macbook";
}

mixin A {}
mixin B on A {}
mixin C on B {}

class MixinTest with A, B, C {}
