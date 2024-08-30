import 'package:flutter/material.dart';

import 'package:flutter_tech_task/presentation/widgets/common_widgets/app_colors.dart';
import 'package:flutter_tech_task/presentation/widgets/common_widgets/common_text.dart';

/// Uygulama sayfalarından ortak olarak çağırmak üzere hazırlanan AppBar.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// AppBar' ın çağrılması sırasında doğru gösterim için gerekli değişkenlerin
  /// tanımlanması.

  const CustomAppBar({required this.title, required this.actions, super.key});

  /// AppBar üzerinde yazacak başlığın tanımlanması.

  final String title;

  /// AppBar üzerinde gösterilecek 'Widget' tipli listelerin  tanımlanması.

  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? lightColor.shade500
          : darkColor.shade900,
      title: AppTextStyles.appBarText(title: title, context: context),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
