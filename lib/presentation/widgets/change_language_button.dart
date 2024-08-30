import 'package:flutter/material.dart';
import 'package:flutter_tech_task/presentation/providers/language_provider.dart';
import 'package:provider/provider.dart';

/// Dil değişimini sağlayan Widget.
class ChangeLanguageButton extends StatelessWidget {
  /// Widget' a benzersiz key ataması.
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showLanguageDialog(context),
      icon: const Icon(Icons.language),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dil Seçin'),
          content: DropdownButton<Locale>(
            value: languageProvider.currentLocale,
            items: const [
              DropdownMenuItem(
                value: Locale('tr', 'TR'),
                child: Text('Türkçe'),
              ),
              DropdownMenuItem(
                value: Locale('en', 'US'),
                child: Text('English'),
              ),
            ],
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                languageProvider.changeLocale(newLocale);
              }
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
