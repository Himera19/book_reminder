import 'package:book_reminder/models/book_model.dart';
import 'package:book_reminder/pages/app_pages/book_detail_page.dart';
import 'package:book_reminder/presentation/widgets/common_widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Kitap listesinin gösterilmesini sağlayan 'Widget' yapısı.

class BookListView extends StatelessWidget {
  /// Kitap listesinin doğru gösterimi için gerekli değişkenlerin tanımlanması.
  const BookListView({
    required this.books,
    super.key,
    this.trailingWidgetBuilder,
  });

  /// Gösterim için gerekli kitap listesinin tanımlanması.
  final List<BookModel> books;

  /// ListView içerisinde trailing için gerekli değişkenin tanımlanması
  /// (opsiyonel).
  final Widget Function(BuildContext context, BookModel book)?
      trailingWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: books.isEmpty
          ? Center(
              child: Center(
              child: AppTextStyles.warnText(
                  context: context,
                  title: AppLocalizations.of(context)!.booksEmpty,),
            ),)
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (_, index) {
                final book = books[index];
                return ListTile(
                  title: AppTextStyles.bookListTitleText(
                    title: book.title,
                    context: context,
                  ),
                  subtitle: AppTextStyles.bookListContentText(
                    title: book.publisher,
                    context: context,
                  ),
                  trailing: trailingWidgetBuilder?.call(context, book),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<BookDetailPage>(
                        builder: (context) => BookDetailPage(bookModel: book),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
