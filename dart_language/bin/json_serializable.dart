class Order {
  final int id;
  final String name;
  final DateTime orderAt;
  final bool isPreOrder;
  final List<Car> cars;

  const Order({
    required this.id,
    required this.name,
    required this.orderAt,
    required this.isPreOrder,
    required this.cars,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      name: json["name"],
      orderAt: json["orderAt"],
      isPreOrder: json["isPreOrder"],
      cars: List<Car>.from(json["cars"])
          .map((e) => Car.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Car {
  final String name;
  final int colorType;

  const Car({required this.name, required this.colorType});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json["name"],
      colorType: json["colorType"],
    );
  }
}

void main() {}
