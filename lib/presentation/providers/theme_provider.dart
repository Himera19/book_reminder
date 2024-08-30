import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/presentation/widgets/common_widgets/app_colors.dart';
import 'package:hive/hive.dart';

/// Aydınlık tema için [ThemeData] entegrasyonu.
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: lightColor,
  useMaterial3: true,
  scaffoldBackgroundColor: lightColor,
);

/// Karanlık tema için [ThemeData] entegrasyonu.
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: darkColor,
  useMaterial3: true,
);

/// Uygulama temasının dinamik bir şekilde değişiminin sağlanması, [Hive] ile
/// seçili temanın önbellekte tutulması için hazırlanan 'Provider' sınıfı.
class ThemeProvider extends ChangeNotifier {
  /// Constructor üzerinden [Hive] box verisini çekme ve temayı önbellekten
  /// yükleme.
  ThemeProvider(this._box) {
    _loadFromHive();
  }

  final Box<dynamic> _box;
  static const String _key = 'theme';

  bool _darkTheme = true;

  /// Şu anki tema bilgisini döndürme.
  bool get darkTheme => _darkTheme;

  /// Uygulama temasını değiştirme ve [Hive] box içerisine yeni temayı kaydetme.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  Future<void> toggleTheme() async {
    _darkTheme = !_darkTheme;
    await _saveToHive();
    notifyListeners();
  }

  /// Temayı [Hive] box içerisinden yükleme.
  ///
  /// İşlem sonrası notifyListener ile state güncellemesini sağlama.
  Future<void> _loadFromHive() async {
    final savedTheme = _box.get(_key) as bool?;
    if (savedTheme != null) {
      _darkTheme = savedTheme;
    } else {
      _darkTheme =
          PlatformDispatcher.instance.platformBrightness == Brightness.dark;
    }
    notifyListeners();
  }

  /// [Hive] box içerisine temayı ekleme.
  Future<void> _saveToHive() async {
    await _box.put(_key, _darkTheme);
  }
}
