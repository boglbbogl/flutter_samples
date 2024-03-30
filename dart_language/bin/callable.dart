class Hero {
  String call(String name) => "Hero $name !";
  String callTest(String name) => "Test $name !";
}

class Watch {
  String call(DateTime date) {
    return "${date.month.toString().padLeft(2, "0")}월 ${date.day.toString().padLeft(2, "0")}일, ${date.year}년";
  }
}

void main() {
  Watch watch = Watch();
  String message = watch(DateTime(2000, 1, 1));
  print(message);
}
