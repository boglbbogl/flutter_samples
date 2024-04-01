void main() {
  User tyger = User("tyger", 100);
  print(tyger.hashCode);
  tyger = tyger.copyWith(age: 20);
  print(tyger.hashCode);
}

class User {
  final String name;
  final int age;

  const User(this.name, this.age);

  User copyWith({
    final String? name,
    final int? age,
  }) {
    return User(
      name ?? this.name,
      age ?? this.age,
    );
  }
}
