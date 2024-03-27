void main() {
  Order boxter = Order(
    orderNo: 1,
    code: "boxter",
    name: null,
    orderAt: DateTime.now(),
    startAt: null,
    endAt: null,
    isPreOrder: true,
    memos: [],
  );
  boxter = boxter.copyWith(orderNo: 3);
}

class Order {
  final int orderNo;
  final String code;
  final String? name;
  final DateTime orderAt;
  final DateTime? startAt;
  final DateTime? endAt;
  final bool isPreOrder;
  final List<String> memos;

  const Order({
    required this.orderNo,
    required this.code,
    required this.name,
    required this.orderAt,
    required this.startAt,
    required this.endAt,
    required this.isPreOrder,
    required this.memos,
  });

  // OrderCopyWith get copyWith => OrderImplementsCopyWith(this);

  Order copyWith({
    final int? orderNo,
    final String? code,
    final String? name,
    final DateTime? orderAt,
    final DateTime? startAt,
    final DateTime? endAt,
    final bool? isPreOrder,
    final List<String>? memos,
  }) {
    return Order(
      orderNo: orderNo ?? this.orderNo,
      code: code ?? this.code,
      name: name ?? this.name,
      orderAt: orderAt ?? this.orderAt,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      isPreOrder: isPreOrder ?? this.isPreOrder,
      memos: memos ?? this.memos,
    );
  }
}

abstract class OrderCopyWith {
  call({
    final int orderNo,
    final String code,
    final String? name,
    final DateTime orderAt,
    final DateTime? startAt,
    final DateTime? endAt,
    final bool isPreOrder,
    final List<String> memos,
  });
}

class OrderImplementsCopyWith implements OrderCopyWith {
  final Order value;
  static const Object _un = Object();

  const OrderImplementsCopyWith(this.value);
  @override
  call({
    Object? orderNo = _un,
    Object? code = _un,
    Object? name = _un,
    Object? orderAt = _un,
    Object? startAt = _un,
    Object? endAt = _un,
    Object? isPreOrder = _un,
    Object? memos = _un,
  }) {
    return Order(
      orderNo: orderNo == _un ? value.orderNo : orderNo as int,
      code: code == _un ? value.code : code as String,
      name: name == _un ? value.name : name as String?,
      orderAt: orderAt == _un ? value.orderAt : orderAt as DateTime,
      startAt: startAt == _un ? value.startAt : startAt as DateTime?,
      endAt: endAt == _un ? value.endAt : endAt as DateTime?,
      isPreOrder: isPreOrder == _un ? value.isPreOrder : isPreOrder as bool,
      memos: memos == _un ? value.memos : memos as List<String>,
    );
  }
}
