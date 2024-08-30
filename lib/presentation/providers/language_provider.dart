import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/// Uygulama dilinin dinamik bir şekilde değişiminin sağlanması, [Hive] ile
/// seçili dilin önbellekte tutulması için hazırlanan 'Provider' sınıfı.
class LanguageProvider extends ChangeNotifier {
  /// Constructor üzerinden [Hive] box verisini çekme ve dili önbellekten
  /// yükleme.
  LanguageProvider(this._box) {
    _loadLocaleFromHive();
  }
  final Box<dynamic> _box;
  Locale _currentLocale = const Locale('tr', 'TR');

  /// Şu anki dil bilgisini döndürme.
  Locale get currentLocale => _currentLocale;

  /// Uygulama dilini değiştirme ve [Hive] box içerisine yeni dili kaydetme.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  Future<void> changeLocale(Locale newLocale) async {
    if (newLocale != _currentLocale) {
      _currentLocale = newLocale;
      notifyListeners();
      await _saveLocaleToHive(newLocale);
    }
  }

  /// [Hive] box içerisine dili ve ülkeyi ekleme.
  Future<void> _saveLocaleToHive(Locale locale) async {
    await _box.put('languageCode', locale.languageCode);
    await _box.put('countryCode', locale.countryCode);
  }

  /// Dili ve ülkeyi [Hive] box içerisinden yükleme.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  void _loadLocaleFromHive() {
    final languageCode = _box.get('languageCode') as String?;
    final countryCode = _box.get('countryCode') as String?;
    _currentLocale = Locale(languageCode ?? 'tr', countryCode ?? 'TR');
    notifyListeners();
  }
}
