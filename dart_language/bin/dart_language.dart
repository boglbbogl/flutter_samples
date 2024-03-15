//

void main() {
  List<int> _numbers = List.generate(10, (i) => i);
  for (int i = _numbers.length - 1; -1 < i; i--) {
    print(i);
    print(_numbers[i]);
  }
}
