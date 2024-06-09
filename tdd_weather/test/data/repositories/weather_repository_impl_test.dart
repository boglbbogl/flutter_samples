import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_weather/data/repositories/weather_repository_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(mockWeatherRemoteDataSource);
  });

  const String testCityName = "New York";

  group("get current weather", () {
    test(
        "should return current weather when a call to data source is successful",
        () async {
      // when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
      //     .thenAnswer((_) async => testWeatherModel);
    });
  });
}
