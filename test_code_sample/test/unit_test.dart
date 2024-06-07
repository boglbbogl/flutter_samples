import 'package:flutter_test/flutter_test.dart';
import 'package:test_code_sample/unit_test.dart';

void main() {
  group("Person 기능 테스트", () {
    test("초기 값이 NULL 인가 ?", () {
      final Person _person = Person();
      expect(_person.name, null);
    });

    test("이름을 변경할 수 있는가 ?", () {
      final Person _person = Person();
      const String name = "TYGER";
      _person.changedName(name);
      expect(_person.name, name);
    });
  });
  group("Counter 기능 테스트", () {
    test("초기 값이 0인가 ?", () {
      final Counter _counter = Counter();
      expect(_counter.value, 0);
    });

    test("증가 하는가 ?", () {
      final Counter _counter = Counter();
      _counter.increment();
      expect(_counter.value, 1);
    });

    test("감소 하는가 ?", () {
      final Counter _counter = Counter();
      _counter.decrement();
      expect(_counter.value, -1);
    });
  });
}
