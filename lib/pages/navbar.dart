import 'package:animations/animations.dart';
import 'package:book_reminder/pages/app_pages/book_list_page.dart';
import 'package:book_reminder/pages/app_pages/favorites_page.dart';
import 'package:book_reminder/presentation/widgets/common_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

/// Sayfalara geçiş için oluşturulan alt bar.
class Navbar extends StatefulWidget {
  /// Sayfaya benzersiz key ataması.

  const Navbar({super.key});

  @override
  NavbarState createState() => NavbarState();
}

/// Navbar içerisine geçiş için istenilen sayfaların 'Widget' tipli list
/// değişkenine eklenmesi.
class NavbarState extends State<Navbar> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    const BookListPage(),
    const FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 750),
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: Theme.of(context).brightness == Brightness.light
              ? lightColor.shade200
              : darkColor.shade900,
          child: child,
        ),
        child: _pages[_pageIndex],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(),
        child: GNav(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? lightColor.shade500
              : darkColor.shade900,
          gap: 25,
          activeColor: Theme.of(context).brightness == Brightness.light
              ? darkColor.shade900
              : lightColor.shade50,
          iconSize: 35,
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black54
              : Colors.grey.shade600,
          tabs: [
            GButton(
              icon: Iconsax.book,
              text: AppLocalizations.of(context)!.navbarBook,
            ),
            GButton(
              icon: Iconsax.heart,
              text: AppLocalizations.of(context)!.navbarFavorite,
            ),
          ],
          selectedIndex: _pageIndex,
          onTabChange: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
