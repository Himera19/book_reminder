import 'package:book_reminder/models/book_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

/// Kullanıcının favori kitaplarını Hive ile lokalden çekebilmesi için
/// oluşturulan 'Provider' sınıfı.
class FavoriteProvider extends ChangeNotifier {
  /// [FavoriteProvider] için 'favorites' isimli [Hive] box oluşturma ve
  /// entegrasyonu sağlama.
  FavoriteProvider(this._box);
  final Box<BookModel> _box;

  /// Hive box üzerinden favorilenen kitapların tümüne erişme
  ///
  /// Erişilen kitapları [BookModel] tipli bir liste ile döndürme.
  List<BookModel> getAllFavorites() {
    return _box.values.toList();
  }

  /// Favorilenen kitapları oluşturduğumuz Hive box içerisine [bookModel] tipi
  /// ile veri ekleme.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  Future<void> addFavorite(BookModel bookModel) async {
    await _box.add(bookModel);
    notifyListeners();
  }

  /// Favorilediğimiz [bookModel] tipli verileri Hive box içerisinden silme.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  Future<void> removeFavorite(BookModel bookModel) async {
    final index = _box.values.toList().indexOf(bookModel);
    if (index != -1) {
      await _box.deleteAt(index);
      notifyListeners();
    }
  }

  /// Seçilen [bookModel] tipli kitabın favorilerdeki varlığını kontrol etme.
  ///
  /// Eğer var ise 'true', yok ise 'false' döndürme.
  bool isFavorite(BookModel bookModel) {
    return _box.values.any((b) => b.id == bookModel.id);
  }
}
