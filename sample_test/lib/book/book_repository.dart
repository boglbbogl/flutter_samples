import 'dart:convert';
import 'package:sample_test/book/book_model.dart';
import 'package:sample_test/server_exception.dart';
import 'package:http/http.dart' as http;

abstract class BookRemoteDataSource {
  Future<BookModel> getCurrentBook(String name);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client client;

  const BookRemoteDataSourceImpl({required this.client});

  @override
  Future<BookModel> getCurrentBook(String name) async {
    final response = await client.get(
        Uri.parse("https://dapi.kakao.com/v3/search/book?query=해리&size=1"),
        headers: {
          "Authorization": "KakaoAK ceb72b2f0cb7b4614d30c220b76609bf",
        });
    if (response.statusCode == 200) {
      return BookModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
