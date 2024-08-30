import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Kitapları arama ve filtreleme işlemlerini yapan Widget.
class SearchInput extends StatelessWidget {

  /// Kitapları arama ve filtreleme işlemi için gerekli değişkenlerin
  /// tanımlanması.

  const SearchInput({required this.onSearch, super.key});
  /// Yazılan içeriğin dinamik olarak değişimi.
  /// Bu callback, kullanıcının metin girmesiyle tetiklenir ve `onSearch`
  /// fonksiyonunu çağırır.

  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.searchBook,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45)),
          ),
        ),
      ),
    );
  }
}
