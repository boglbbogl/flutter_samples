import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_books/data/models/book_item_model.dart';
import 'package:tdd_books/data/models/book_model.dart';
import 'package:tdd_books/domain/entities/book.dart';

import '../../helpers/json_reader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const BookModel testBook = BookModel(isEnd: false, items: [
    BookItemModel(
        title: "해리 포터와 마법사의 돌 1(해리포터 20주년 개정판)",
        thumbnail:
            "https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5134210%3Ftimestamp%3D20240614132910"),
  ]);

  test("BookModel이 Book의 자식 클래스인지 ?", () {
    expect(testBook, isA<Book>());
  });

  test("JSON -> BookModel 직렬화가 이뤄지는지 ?", () async {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson("helpers/dummy_data.json"));
    final result = BookModel.fromJson(jsonMap);
    expect(result, equals(testBook));
  });
}
