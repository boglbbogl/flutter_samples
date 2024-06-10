import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_sample/image/image_data.dart';
import 'package:mockito_sample/image/image_repository.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late ImageRepository imageRepository;

  setUp(() {
    imageRepository = MockImageRepository();
  });

  test('fetch method returns ImageData', () async {
    // Given
    const int testId = 1;
    const String testName = 'Test Image';
    const imageData = ImageData(name: testName);
    when(imageRepository.fetch(testId)).thenAnswer((_) async => imageData);

    // When
    final result = await imageRepository.fetch(testId);

    // Then
    expect(result, equals(imageData));
  });
}
