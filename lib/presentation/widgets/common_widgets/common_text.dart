import 'package:flutter/material.dart';
import 'package:flutter_tech_task/presentation/widgets/common_widgets/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// Uygulama içerisinde çeşitli alanlar için gerekli Text verilerinin yönetimini
/// sağlayan sınıf.
class AppTextStyles {
  /// AppBar üzerinde yazacak başlık.
  static Text appBarText(
      {required BuildContext context, required String title,}) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontSize: 25,
        fontStyle: FontStyle.normal,
        color: Theme.of(context).brightness == Brightness.light
            ? darkColor.shade900
            : lightColor.shade50,
      ),
    );
  }

  /// Liste görünümü ile gösterilen kitaplarının isimleri.

  static Text bookListTitleText({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.light
            ? darkColor.shade900
            : lightColor.shade50,
      ),
    );
  }

  /// Liste görünümü ile gösterilen kitaplarının yayımcıları.

  static Text bookListContentText({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontSize: 15,
        color: Theme.of(context).brightness == Brightness.light
            ? darkColor.shade900
            : lightColor.shade50,
      ),
    );
  }

  /// Kitap detayının gösterimi sırasında kullanılan başlık.

  static TextSpan bookDetailTitleText({
    required BuildContext context,
    required String title,
  }) {
    return TextSpan(
      text: title,
      style: GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.light
            ? darkColor.shade900
            : lightColor.shade50,
      ),
    );
  }

  /// Kitap detayının gösterimi sırasında kullanılan içerik.

  static TextSpan bookDetailContentText({
    required BuildContext context,
    required String title,
  }) {
    return TextSpan(
      text: title,
      style: GoogleFonts.nunito(
        fontSize: 17,
        color: Theme.of(context).brightness == Brightness.light
            ? darkColor.shade900
            : lightColor.shade50,
      ),
    );
  }

  /// Hata veya uyarı mesajlarının gösterimi sırasına gösterilen içerik.

  static Text warnText({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontSize: 20,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.red.shade900
            : Colors.red.shade50,
      ),
    );
  }
}
