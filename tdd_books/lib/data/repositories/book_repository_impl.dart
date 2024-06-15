import 'package:dartz/dartz.dart';
import 'package:tdd_books/core/errors/server_exception.dart';
import 'package:tdd_books/core/errors/server_failure.dart';
import 'package:tdd_books/data/datasources/book_remote_data_source.dart';
import 'package:tdd_books/domain/entities/book.dart';
import 'package:tdd_books/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource bookRemoteDataSource;

  const BookRepositoryImpl(this.bookRemoteDataSource);

  @override
  Future<Either<Failure, Book>> getSearchBooks(String query) async {
    try {
      final result = await bookRemoteDataSource.getSearchBooks(query);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Failure"));
    }
  }
}
