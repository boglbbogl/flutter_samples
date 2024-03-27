abstract class Hero {
  String get name;
}

abstract class Studio {
  void printStudio();
}

abstract class Mavel implements Studio {
  void printMavel();
}

abstract class DC implements Studio {
  void printDC();
}

abstract class Punch {
  void printPunch();
}

abstract class Kick {
  void printKick();
}

abstract class Fly {
  void printFly();
}

abstract class Bim {
  void printBim();
}

class IronMan implements Hero, Mavel, Punch, Kick, Fly, Bim {
  @override
  String get name => "IronMan";

  @override
  void printBim() {}

  @override
  void printFly() {}

  @override
  void printKick() {}

  @override
  void printMavel() {}

  @override
  void printPunch() {}

  @override
  void printStudio() {}
}

class BatMan implements Hero, DC, Punch, Kick {
  @override
  String get name => "BatMan";

  @override
  void printDC() {}

  @override
  void printKick() {}

  @override
  void printPunch() {}

  @override
  void printStudio() {}
}
