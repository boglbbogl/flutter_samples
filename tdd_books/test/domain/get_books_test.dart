import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_books/domain/entities/book.dart';
import 'package:tdd_books/domain/usecases/get_search_books.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockBookRepository mockBookRepository;
  late GetSearchBooks usecase;

  setUp(() {
    mockBookRepository = MockBookRepository();
    usecase = GetSearchBooks(mockBookRepository);
  });

  const String query = "해리";

  const Book testBooks = Book(isEnd: false, items: []);

  test("저장소에서 책 리스트를 가져오는가 ?", () async {
    when(mockBookRepository.getSearchBooks(query))
        .thenAnswer((_) async => testBooks);

    final Book result = await usecase(query);

    expect(result, testBooks);

    verify(mockBookRepository.getSearchBooks(query));

    verifyNoMoreInteractions(mockBookRepository);
  });
}
