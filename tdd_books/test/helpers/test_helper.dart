import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_books/data/datasources/book_remote_data_source.dart';
import 'package:tdd_books/domain/repositories/book_repository.dart';

@GenerateMocks(
  [
    BookRepository,
    BookRemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
