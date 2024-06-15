import 'package:dartz/dartz.dart';
import 'package:tdd_books/core/errors/server_failure.dart';
import 'package:tdd_books/domain/entities/book.dart';
import 'package:tdd_books/domain/repositories/book_repository.dart';

class GetSearchBooks {
  final BookRepository bookRepository;
  const GetSearchBooks(this.bookRepository);

  Future<Either<Failure, Book>> call(String query) async {
    return bookRepository.getSearchBooks(query);
  }
}
