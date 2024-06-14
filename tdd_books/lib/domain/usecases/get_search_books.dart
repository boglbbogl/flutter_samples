import 'package:tdd_books/domain/entities/book.dart';
import 'package:tdd_books/domain/repositories/book_repository.dart';

class GetSearchBooks {
  final BookRepository bookRepository;
  const GetSearchBooks(this.bookRepository);

  Future<Book> call(String query) async {
    return bookRepository.getSearchBooks(query);
  }
}
