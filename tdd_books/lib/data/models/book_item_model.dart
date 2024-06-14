import 'package:tdd_books/domain/entities/book_item.dart';

class BookItemModel extends BookItem {
  const BookItemModel({
    required super.title,
    required super.thumbnail,
  });

  factory BookItemModel.fromJson(Map<String, dynamic> json) => BookItemModel(
        title: json["title"],
        thumbnail: json["thumbnail"],
      );
}
