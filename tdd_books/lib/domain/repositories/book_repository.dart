import 'package:tdd_books/domain/entities/book.dart';

abstract class BookRepository {
  Future<Book> getSearchBooks(String query);
}
