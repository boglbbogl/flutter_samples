import 'dart:convert';

import 'package:tdd_books/core/constants/constant.dart';
import 'package:tdd_books/core/errors/server_exception.dart';
import 'package:tdd_books/data/models/book_model.dart';
import 'package:tdd_books/domain/entities/book.dart';
import 'package:http/http.dart' as http;

abstract class BookRemoteDataSource {
  Future<Book> getSearchBooks(String query);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client client;

  const BookRemoteDataSourceImpl(this.client);

  @override
  Future<Book> getSearchBooks(String query) async {
    final response = await client.get(Uri.parse(Constant.bookSearchPath(query)),
        headers: Constant.header);
    if (response.statusCode == 200) {
      return BookModel.fromJson(json.decode(response.body));
    } else {
      throw const ServerException();
    }
  }
}
