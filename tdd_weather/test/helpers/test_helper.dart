import 'package:mockito/annotations.dart';
import 'package:tdd_weather/data/data_sources/remote_data_source.dart';
import 'package:tdd_weather/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    WeatherRepository,
    WeatherRemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
