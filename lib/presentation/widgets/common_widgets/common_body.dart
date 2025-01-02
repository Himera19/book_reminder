import 'package:book_reminder/presentation/widgets/common_widgets/app_colors.dart';
import 'package:book_reminder/presentation/widgets/common_widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

/// Uygulama sayfalarından ortak olarak çağırmak üzere hazırlanan Body.

class CustomBody extends StatelessWidget {
  /// Body' nin çağrılması sırasında doğru gösterim için gerekli değişkenlerin
  /// tanımlanması.
  const CustomBody({
    required this.title,
    required this.child,
    super.key,
    this.actions,
  });
  /// [CustomAppBar] için başlığın tanımlanması.
  final String title;
  /// [CustomAppBar] için actions verisinin tanımlanması.

  final List<Widget>? actions;

  /// Döndürülmesi istenilen body widget' inin tanımlanması.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title, actions: actions),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? darkColor.shade800
              : lightColor.shade200,
        ),
        child: child,
      ),
    );
  }
}
