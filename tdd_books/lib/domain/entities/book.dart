import 'package:equatable/equatable.dart';
import 'package:tdd_books/domain/entities/book_item.dart';

class Book extends Equatable {
  final bool isEnd;
  final List<BookItem> items;

  const Book({
    required this.isEnd,
    required this.items,
  });

  @override
  List<Object?> get props => [isEnd, items];
}
