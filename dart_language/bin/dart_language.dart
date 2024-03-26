//

void main() {}

abstract class PC {}

abstract class Phone {}

mixin Camera on Phone {
  void shoot() => print("사진 촬영 !");
}

mixin Photo {
  void openPhotos() => print("사진첩 오픈 !");
}

mixin Lock {
  void unLock() => print("잠금해제 !");
}

class Mac extends PC with Photo, Lock {}

class IPhone extends Phone with Camera, Photo, Lock {}





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

// mixin Beam on Hero {
//   void beam() => print("${super.name} Laser Beam !");
// }

// class IronMan extends Hero with Fly, Punch, Kick, Beam {
//   IronMan() : super("IronMan");
// }

// class BatMan extends Hero with Punch, Kick {
//   const BatMan() : super("BatMan");
// }

// class SuperMan extends Hero with Fly, Punch, Kick, Beam {
//   SuperMan() : super("SuperMan");
// }
