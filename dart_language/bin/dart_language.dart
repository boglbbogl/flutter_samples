//

void main() {
  C c = C();
  c.log();
}

// class AClass

mixin A {
  void log() => print("A mixin");
}
mixin B {
  void log() => print("B mixin");
}
mixin D {
  void log() => print("D mixin");
}

class C with A, B, D {}


// void main() {
//   IronMan ironMan = IronMan();
//   SuperMan superMan = SuperMan();
//   print(
//       "${ironMan.name}의 공격력은 ${ironMan.getAttack()}, 방어력은 ${ironMan.getDefence()}이다.");
//   print(
//       "${superMan.name}의 공격력은 ${superMan.getAttack()}, 방어력은 ${superMan.getDefence()}이다.");
// }

// abstract class Hero {
//   final String name;
//   const Hero(this.name);

//   int getAttack();
//   int getDefence();
// }

// class IronMan implements Hero {
//   final int tier = 9;
//   @override
//   int getAttack() => (10 - tier) * 100;

//   @override
//   int getDefence() => (10 - tier) * 20;

//   @override
//   String get name => "IronMan";
// }

// class Hulk implements Hero {
//   final int tier = 7;
//   @override
//   int getAttack() => (10 - tier) * 100;

//   @override
//   int getDefence() => (10 - tier) * 20;

//   @override
//   String get name => "Hulk";
// }

// class SuperMan implements Hero {
//   @override
//   int getAttack() => 1000;

//   @override
//   int getDefence() => 100;

//   @override
//   String get name => "SuperMan";
// }

// // class Hulk extends Hero {
// //   final String name = "Hulk";
// //   const Hulk({super.tier = 7, super.name = "Hulk"});
// // }

// // class SuperMan extends Hero {
// //   const SuperMan({required super.tier});
// // }
