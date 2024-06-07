import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_weather/core/constants/constants.dart';
import 'package:tdd_weather/core/error/exception.dart';
import 'package:tdd_weather/data/data_sources/remote_data_source.dart';
import 'package:tdd_weather/data/models/weather_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  const String testCityName = "New York";
  group("get current weather", () {
    test("should return weather model when the response code is 200", () async {
      when(mockHttpClient
              .get(Uri.parse(Urls.currentWeatherByName(testCityName))))
          .thenAnswer((_) async => http.Response(
              readJson("helpers/dummy_data/dummy_weather_response.json"), 200));
      final result =
          await weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);
      expect(result, isA<WeatherModel>());
    });

    test(
        "should throw a server exception when the response code is 404 or other",
        () async {
      when(mockHttpClient
              .get(Uri.parse(Urls.currentWeatherByName(testCityName))))
          .thenAnswer((_) async => http.Response("Not found", 404));
      call() => weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);
      await expectLater(call(), throwsA(isA<ServerException>()));
    });
  });
}
