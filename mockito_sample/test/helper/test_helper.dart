import 'package:mockito/annotations.dart';

import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    // WeatherRepository,
    // WeatherRemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
