import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_books/data/models/book_model.dart';
import 'package:tdd_books/data/repositories/book_repository_impl.dart';
import 'package:tdd_books/domain/entities/book.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockBookRemoteDataSource mockBookRemoteDataSource;
  late BookRepositoryImpl bookRepositoryImpl;

  setUp(() {
    mockBookRemoteDataSource = MockBookRemoteDataSource();
    bookRepositoryImpl = BookRepositoryImpl(mockBookRemoteDataSource);
  });

  const String testQuery = "해리";

  const BookModel testBookModel = BookModel(isEnd: false, items: []);
  const Book testBook = Book(isEnd: false, items: []);

  test("서버로부터 책 검색 결과를 가져오는지 ?", () async {
    when(mockBookRemoteDataSource.getSearchBooks(testQuery))
        .thenAnswer((_) async => testBookModel);
    final result = await bookRepositoryImpl.getSearchBooks(testQuery);
    verify(mockBookRemoteDataSource.getSearchBooks(testQuery));
    expect(result, equals(testBook));
  });
}
