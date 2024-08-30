import 'dart:convert';
import 'package:flutter_tech_task/data/constants.dart';
import 'package:flutter_tech_task/models/book_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

/// Kullanıcının kitaplara API aracılığı ile erişmesi ve ardından Hive box ile
/// lokalden çağırabilmesi için sınıf oluşturma.
class BookRepository {
  /// İlgili Hive kutusunu başlatmak için `_initializeBox` fonksiyonunun
  /// tetiklenmesi.
  BookRepository() {
    _initializeBox();
  }

  /// [BookModel] yapsındaki box verisinin tanımlanması.
  late Box<BookModel> bookBox;

  /// http istemcisinin tanımlanması.

  http.Client httpClient = http.Client();

  Future<void> _initializeBox() async {
    bookBox = await Hive.openBox<BookModel>('books');
  }

  /// API sorgusu ile kitaplara erişim için hazırlanan [BookModel] listesi
  /// döndüren, dönen veriyi de 'books' isimli [Hive] box içerisine yazan
  /// fonksiyon.
  ///
  /// Hata durumunda throw ile hata mesajı döndürme
  Future<List<BookModel>> fetchBooks() async {
    try {
      if (bookBox.isNotEmpty) {
        return bookBox.values.toList();
      } else {
        final response = await httpClient.get(Uri.parse('$apiURL/books'));

        if (response.statusCode == 200) {
          final jsonResponse =
              json.decode(response.body) as Map<String, dynamic>;
          final booksData = jsonResponse['data'] as List<dynamic>;
          final books = booksData
              .map((book) => BookModel.fromJson(book as Map<String, dynamic>))
              .toList();

          for (final book in books) {
            await bookBox.put(book.id, book);
          }
          return books;
        } else {
          throw Exception(
            'API Hatası: ${response.statusCode} ${response.reasonPhrase}',
          );
        }
      }
    } on http.ClientException catch (e) {
      throw Exception('Bağlantı Hatası: ${e.message}');
    } on FormatException catch (e) {
      throw Exception('Veri erişimi hatası: ${e.message}');
    } catch (e) {
      throw Exception('Bilinmeyen Hata: $e');
    }
  }
}
