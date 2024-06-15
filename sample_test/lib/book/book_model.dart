class BookEntity {
  final bool isEnd;

  const BookEntity({required this.isEnd});
}

class BookModel extends BookEntity {
  const BookModel({required super.isEnd});
  factory BookModel.fromJson(Map<String, dynamic> json) =>
      BookModel(isEnd: json["meta"]["is_end"]);
}
