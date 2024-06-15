import 'package:dartz/dartz.dart';
import 'package:tdd_books/core/errors/server_failure.dart';
import 'package:tdd_books/domain/entities/book.dart';

abstract class BookRepository {
  Future<Either<Failure, Book>> getSearchBooks(String query);
}
