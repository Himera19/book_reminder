import 'package:book_reminder/presentation/providers/book_provider.dart';
import 'package:book_reminder/presentation/widgets/book_list_view.dart';
import 'package:book_reminder/presentation/widgets/change_language_button.dart';
import 'package:book_reminder/presentation/widgets/change_theme_button.dart';
import 'package:book_reminder/presentation/widgets/common_widgets/common_body.dart';
import 'package:book_reminder/presentation/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

/// Erişilen kitapları liste şeklinde sunmak için oluşturulan sayfa.
class BookListPage extends StatefulWidget {
  /// Sayfaya benzersiz key ataması.
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookProvider>(context, listen: false).fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = context.watch<BookProvider>();

    return CustomBody(
      actions: const [ChangeThemeButton(), ChangeLanguageButton()],

      title: AppLocalizations.of(context)!.appBarBook,
      child: Column(
        children: [
          SearchInput(onSearch: bookProvider.searchBooks),
          BookListView(
            books: bookProvider.books,
          ),
        ],
      ),
    );
  }
}
