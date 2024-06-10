import 'package:http/http.dart' as http;
import 'package:mockito_sample/image/image_data.dart';

class ImageRepository {
  final http.Client client;

  const ImageRepository(this.client);

  Future<ImageData?> fetch(int no) async {
    try {} catch (_) {
      return null;
    }
  }
}
