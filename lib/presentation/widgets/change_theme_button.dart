import 'package:flutter/material.dart';
import 'package:flutter_tech_task/presentation/providers/theme_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

/// Tema değişimini sağlayan Widget.
class ChangeThemeButton extends StatelessWidget {
  /// Widget'a benzersiz key ataması.
  const ChangeThemeButton({super.key, this.onChanged});

  /// Tema değiştiğinde çağrılacak callback fonksiyonu.
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: () {
        themeProvider.toggleTheme();
        onChanged?.call();
      },
      icon: Icon(themeProvider.darkTheme ? Iconsax.sun_1 : Iconsax.moon),
    );
  }
}
