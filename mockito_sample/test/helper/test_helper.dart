import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito_sample/image/image_repository.dart';

@GenerateMocks(
  [
    ImageRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
