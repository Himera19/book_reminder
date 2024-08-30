import 'package:hive/hive.dart';

part 'book_model.g.dart';

/// Kitapların verilerini BookModel tipi ile döndürme ve [Hive] önbellekte
/// tutma.

@HiveType(typeId: 0)


class BookModel {

  /// Kitap verileri için model hazırlama.
  BookModel({
    required this.id,
    required this.title,
    required this.publisher,
    required this.year,
    required this.pages,
    required this.isbn,
  });

  /// BookModel değişkenlerine verilerini atamak için json yapısı ile sorgulama.
  ///
  /// Veri tipi güvenliği için 'as' anahtarı kullanımı.
  ///
  /// Tekrarlanan veri oluşumlarının önüne geçmek ve esnek bir
  /// veri oluşumu için 'factory' kullanımı.
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as int,
      title: json['Title'] as String,
      publisher: json['Publisher'] as String,
      year: json['Year'] as int,
      pages: json['Pages'] as int,
      isbn: json['ISBN'] as String,
    );
  }

  /// '0' index' ine kitap ID' sini ekleme.
  @HiveField(0)
  final int id;

  /// '1' index' ine kitap başlığını ekleme.

  @HiveField(1)
  final String title;

  /// '2' index' ine kitap yayımcısını ekleme.

  @HiveField(2)
  final String publisher;

  /// '3' index' ine basım yılını ekleme.

  @HiveField(3)
  final int year;

  /// '4' index' ine sayfa sayısını ekleme.

  @HiveField(4)
  final int pages;

  /// '5' index' ine ISBN numarasını ekleme.

  @HiveField(5)
  final String isbn;
}
