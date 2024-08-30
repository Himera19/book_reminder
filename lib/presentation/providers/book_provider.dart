import 'package:flutter/material.dart';

import 'package:flutter_tech_task/data/repositories/book_repository.dart';
import 'package:flutter_tech_task/models/book_model.dart';

/// Kitapların listelenmesi, arama yapılması özellikleri için oluşturulan
/// 'Provider' sınıfı.
class BookProvider with ChangeNotifier {
  List<BookModel> _books = [];
  List<BookModel> _filteredBooks = [];

  /// Arama yapılması takdirinde filtreli kitapların, aksi takdirde tüm
  /// kitapların [BookModel] tipli liste şeklinde 'get' edilmesini sağlama.
  List<BookModel> get books =>
      _filteredBooks.isNotEmpty ? _filteredBooks : _books;

  final BookRepository _bookRepository = BookRepository();

  /// [BookRepository] içerisinden tüm kitapların getirilmesi ve [_books] isimli
  /// değişkene atanması.
  ///
  /// [_filteredBooks] verisinin temizlenmesi.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  Future<void> fetchBooks() async {
    try {
      _books = await _bookRepository.fetchBooks();
      _filteredBooks.clear();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Arama yapılan kitabı, [_books] içerisinde 'where' komutu ile taranmasını
  /// sağlama, buna uygun olarak sadece aranılan kriterlere uygun kitapları
  /// [_filteredBooks] üzerinden gösterimini sağlama.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  void searchBooks(String query) {
    if (query.isEmpty) {
      _filteredBooks.clear();
    } else {
      _filteredBooks = _books
          .where(
            (book) => book.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      notifyListeners();
    }
  }
}
