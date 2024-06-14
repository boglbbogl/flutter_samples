import 'package:tdd_books/data/models/book_item_model.dart';
import 'package:tdd_books/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.isEnd,
    required super.items,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        isEnd: json["meta"]["is_end"],
        items: List<BookItemModel>.from(
                json["documents"].map((item) => BookItemModel.fromJson(item)))
            .toList(),
      );
}
