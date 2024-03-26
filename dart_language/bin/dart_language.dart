//

void main() {}

abstract class Car {}

mixin G80 on G70 {}
mixin G70 on Car {}

class Test extends Car with G70, G80 {}

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
