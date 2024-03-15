//

void main() {
  List<int> _numbers = List.generate(10, (i) => i);
  print(_numbers);
  _numbers = _numbers..map((e) => e == 3);
  // _numbers.removeWhere((e) => e % 2 == 0);
  // _numbers.map((e) => e + e).toList();

  // for (int i = 0; i < _numbers.length; i++) {
  //   if (_numbers[i] % 2 == 0) {
  //     _numbers.removeAt(i);
  //   } else {
  //     _numbers[i] = _numbers[i] * 2;
  //   }
  // }
  print(_numbers);
}
