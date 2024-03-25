//

void main() {
  IronMan ironMan = IronMan();
}

abstract class Hero {
  final String name;
  const Hero(this.name);
}

mixin Fly on Hero {
  void fly() => print("${super.name} Fly !");
}

mixin Punch on Hero {
  void punch() => print("${super.name} Punch !");
}

mixin Kick on Hero {
  void kick() => print("${super.name} Kick !");
}

mixin Beam on Hero {
  void beam() => print("${super.name} Laser Beam !");
}

class IronMan extends Hero with Fly, Punch, Kick, Beam {
  IronMan() : super("IronMan");
}

class BatMan extends Hero with Punch, Kick {
  const BatMan() : super("BatMan");
}

class SuperMan extends Hero with Fly, Punch, Kick, Beam {
  SuperMan() : super("SuperMan");
}

// abstract class Hero {
//   late final String name;
//   void getAttack();
//   void getDefence();
// }

// mixin Mavel on Hero {
//   final int tier = 9;
//   @override
//   void getAttack() => print("Mavel $name 공격력 : ${(10 - tier) * 100}");

//   @override
//   void getDefence() => print("Mavel $name 방어력 : ${(10 - tier) * 20}");
// }

// mixin DC on Hero {
//   int get attack;
//   int get defence;
//   @override
//   void getAttack() => print("DC $name 공격력 : $attack");

//   @override
//   void getDefence() => print("DC $name 방어력 : $defence");
// }

// mixin Actor {
//   late final String actor;
//   void getActor() => print("배우 : $actor");
// }

// class IronMan extends Hero with Mavel, Actor {
//   IronMan() {
//     super.name = "IronMan";
//     super.actor = "Robert Downey Jr.";
//   }
// }

// class BatMan extends Hero with DC, Actor {
//   BatMan() {
//     super.name = "SuperMan";
//     super.actor = "Christian Bale";
//   }

//   @override
//   int get attack => 1000;

//   @override
//   int get defence => 300;
// }
