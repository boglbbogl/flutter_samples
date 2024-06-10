import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:mockito_sample/constants/constants.dart';

import '../helper/json_reader.dart';
import '../helper/test_helper.mocks.dart';

// class MockClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  // late ImageRepository imageRepository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    // imageRepository = ImageRepository(mockClient);
  });

  const int testId = 3;

  test("fetch completes successfully when the HTTP call returns 200", () async {
    when(mockHttpClient.get(Uri.parse(Urls.currentImageByNo(testId))))
        .thenAnswer((_) async => http.Response(
            readJson("helpers/dummy_data/dummy_weather_response.json"), 200));
  });
}
