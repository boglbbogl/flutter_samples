import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sample_test/book/book_repository.dart';
import 'package:sample_test/weather/weather_repository.dart';

import 'remote_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateNiceMocks([MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;
  late BookRemoteDataSourceImpl bookRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
    bookRemoteDataSourceImpl = BookRemoteDataSourceImpl(client: mockHttpClient);
  });
  String jsonString = jsonEncode({
    "documents": [
      {
        "authors": ["조앤 K. 롤"],
        "contents":
            "선과 악의 대립 속에서 평범한 어린 소년이 한 사람의 영웅으로 성장해나가는 보편적인 테마를 바탕으로 빈틈없는 소설적 구성과 생생하게 살아 있는 캐릭터, 정교하게 만들어낸 환상의 세계를 접목시킨 21세기의 고전 『해리 포터와 마법사의 돌』 20주년 개정판. 해리 포터를 처음 만나는 어린 세대가 20년이 지나 성인의 눈높이에서 읽어도 어색함 없이 책을 통해 해리 포터 세계를 경험하며 기쁨을 만끽할 수 있도록 고전의 깊이로 담아냈다. 어둠의 마왕 볼드모트",
        "datetime": "2019-11-19T00:00:00.000+09:00",
        "isbn": "8983927623 9788983927620",
        "price": 1000,
        "publisher": "문학수첩",
        "sale_price": 8100,
        "status": "정상판매",
        "thumbnail":
            "https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5134210%3Ftimestamp%3D20240615132200",
        "title": "해리 포터와 마법사의 돌 1(해리포터 20주년 개정판)",
        "translators": ["강동혁"],
        "url":
            "https://search.daum.net/search?w=bookpage&bookId=5134210&q=%ED%95%B4%EB%A6%AC+%ED%8F%AC%ED%84%B0%EC%99%80+%EB%A7%88%EB%B2%95%EC%82%AC%EC%9D%98+%EB%8F%8C+1%28%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0+20%EC%A3%BC%EB%85%84+%EA%B0%9C%EC%A0%95%ED%8C%90%29"
      }
    ],
    "meta": {"is_end": false, "pageable_count": 1000, "total_count": 1123}
  });

  test("test21", () async {
    when(mockHttpClient.get(
        Uri.parse("https://dapi.kakao.com/v3/search/book?query=해리&size=1"),
        headers: {
          "Authorization": "KakaoAK ceb72b2f0cb7b4614d30c220b76609bf",
        })).thenAnswer(
        (_) async => http.Response.bytes(utf8.encode(jsonString), 200));
    await bookRemoteDataSourceImpl.getCurrentBook("name");
  });
}
