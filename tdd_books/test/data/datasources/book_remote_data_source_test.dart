import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_books/core/constants/constant.dart';
import 'package:tdd_books/core/errors/server_exception.dart';
import 'package:tdd_books/data/datasources/book_remote_data_source.dart';
import 'package:tdd_books/data/models/book_model.dart';
import 'package:tdd_books/domain/entities/book.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late BookRemoteDataSourceImpl bookRemoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    bookRemoteDataSource = BookRemoteDataSourceImpl(mockHttpClient);
  });

  const String testQuery = "포터";
  group("[API] 책 검색", () {
    test("Case 200", () async {
      when(mockHttpClient.get(Uri.parse(Constant.bookSearchPath(testQuery)),
              headers: Constant.header))
          .thenAnswer((_) async => http.Response.bytes(
              utf8.encode(readJson("helpers/dummy_data.json")), 200));
      final result = await bookRemoteDataSource.getSearchBooks(testQuery);
      expect(result, isA<BookModel>());
    });
    test("Case 404", () async {
      when(mockHttpClient.get(Uri.parse(Constant.bookSearchPath(testQuery)),
              headers: Constant.header))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      Future<Book> call() => bookRemoteDataSource.getSearchBooks(testQuery);
      await expectLater(call(), throwsA(isA<ServerException>()));
    });
  });
}
