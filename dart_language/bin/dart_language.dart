//

void main() {}

class Test {
  void log() => print("Test !!");
}

class TestImplements implements Test {
  @override
  void log() {
    // TODO: implement log
  }
}

class TestExtends extends Test {}
