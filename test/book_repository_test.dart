import 'dart:io';

import 'package:book_reminder/data/constants.dart';
import 'package:book_reminder/data/repositories/book_repository.dart';
import 'package:book_reminder/models/book_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Http sorgusu için mock oluşturma.
@GenerateMocks([http.Client])
import 'book_repository_test.mocks.dart';

void main() {
  late BookRepository bookRepository;
  late MockClient mockHttpClient;
  late Box<BookModel> bookBox;

  setUpAll(() async {
    // Testler için Hive başlatma.
    final tempDir = await Directory.systemTemp.createTemp();
    Hive
      ..init(tempDir.path)
      ..registerAdapter(BookModelAdapter());
  });

  setUp(() async {
    mockHttpClient = MockClient();

    // Her test için yeni bir Hive kutusu oluşturma.

    bookBox = await Hive.openBox<BookModel>('books');

    // Her test için yeni bir BookRepository örneği oluşturma.
    bookRepository = BookRepository()
      ..bookBox = bookBox
      ..httpClient = mockHttpClient;
  });

  tearDown(() async {
    // Her testten sonra Hive kutusunu kapatma.
    await bookBox.close();
  });

  tearDownAll(() async {
    // Tüm testler bittikten sonra Hive'ı kapatma.

    await Hive.close();
  });

  group('BookRepository', () {
    test('Bağlantı hatası alımı', () async {
      // Arrange

      when(mockHttpClient.get(Uri.parse('$apiURL/books')))
          .thenThrow(http.ClientException('Bağlantı hatası.'));

      // Act & Assert
      expect(
        () async => bookRepository.fetchBooks(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
