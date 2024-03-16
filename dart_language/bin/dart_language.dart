//

import 'dart:collection';

void main() {
  List<int> numbers = UnmodifiableListView(<int>[0, 1, 2, 3, 4, 5]);
  // numbers[2] = 20;
  print(numbers.hashCode);
  numbers = List.from(numbers)
    ..removeAt(2)
    ..insert(2, 20);
  print(numbers.hashCode);
  // print(numbers);
}
