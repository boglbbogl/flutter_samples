import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tdd_movie/core/errors/server_exception.dart';
import 'package:tdd_movie/data/datasources/movie_remote_data_source.dart';
import 'package:tdd_movie/data/datasources/remote/movie_remote_data_source_impl.dart';

import 'movie_remote_data_source_test.mocks.dart';

@GenerateNiceMocks(
  [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  late MovieRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  const String tUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=ba1dd6b0b9b6879f0eb57840acb565d4";
  const String pUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=ba1dd6b0b9b6879f0eb57840acb565d4";
  const String sUrl =
      "https://api.themoviedb.org/3/search/movie?query=Inception&api_key=ba1dd6b0b9b6879f0eb57840acb565d4";
  const String sampleApiResponse = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/path.jpg",
      "id": 1,
      "title": "Sample Movie",
      "original_language": "en",
      "original_title": "Sample Movie",
      "overview": "Overview here",
      "poster_path": "/path2.jpg",
      "media_type": "movie",
      "genre_ids": [1, 2, 3],
      "popularity": 100.0,
      "release_date": "2020-01-01",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 100
    }
  ],
  "total_pages": 1,
  "total_results": 1
}
''';

  test("should perform a GET Request on a url to get trending movies",
      () async {
    // arange
    when(mockHttpClient.get(Uri.parse(tUrl)))
        .thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    // act
    await dataSource.getTrendingMovies();

    // assert
    verify(mockHttpClient.get(Uri.parse(tUrl)));
  });

  test("should perform a GET Request on a url to get popular movies", () async {
    // arange
    when(mockHttpClient.get(Uri.parse(pUrl)))
        .thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    // act
    await dataSource.getPopularMovies();

    // assert
    verify(mockHttpClient.get(Uri.parse(pUrl)));
  });

  test("should perform a GET Request on a url to get search movies", () async {
    // arange
    when(mockHttpClient.get(Uri.parse(sUrl)))
        .thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    // act
    await dataSource.searchMovies("Inception");

    // assert
    verify(mockHttpClient.get(Uri.parse(sUrl)));
  });

  test("should throw a ServerException when the response code is 404",
      () async {
    // arange
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response("Our api response", 404));

    // act
    final call = dataSource.getTrendingMovies;

    // assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });
}
