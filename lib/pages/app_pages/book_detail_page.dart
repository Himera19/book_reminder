import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tech_task/models/book_model.dart';
import 'package:flutter_tech_task/presentation/providers/favorite_provider.dart';
import 'package:flutter_tech_task/presentation/widgets/book_details_widget.dart'
    show BookDetails;
import 'package:flutter_tech_task/presentation/widgets/common_widgets/common_body.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

/// İlgili kitabın detaylarını göstermek için oluşturulan sayfa.
class BookDetailPage extends StatelessWidget {
  /// İlgili kitabın detaylarını döndürmek için üst sınıftan, seçilen kitabın
  /// [BookModel] uzantılı model yapısını alma.
  const BookDetailPage({required this.bookModel, super.key});

  /// İhtiyaç duyulan [BookModel] yapısını 'bookMode' değişkeni ile tanımlama.
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomBody(
      actions: [
        /// İlgili kitabın favorilerdeki varlığını kontrol etmek ve dinamik bir
        /// şekilde varlığını döndürmek için sayfa içeriğini 'FavoriteProvider'
        /// yapısı ile sarmalama
        Consumer<FavoriteProvider>(
          builder: (context, favoriteRepository, child) {
            final isFavorite = favoriteRepository.isFavorite(bookModel);
            return IconButton(
              onPressed: () async {
                if (isFavorite) {
                  await favoriteRepository.removeFavorite(bookModel);
                } else {
                  await favoriteRepository.addFavorite(bookModel);
                }
              },
              icon: isFavorite
                  ? const Icon(
                      Iconsax.heart_remove,
                      color: Colors.red,
                    )
                  : const Icon(
                      Iconsax.heart_add,
                      color: Colors.grey,
                    ),
            );
          },
        ),
      ],
      title: AppLocalizations.of(context)!.appBarDetail,
      child: _buildBookList(bookModel: bookModel, context: context),
    );
  }
}

/// Kitap detaylarını döndürmek için oluşturulan Widget.
Widget _buildBookList({
  required BookModel bookModel,
  required BuildContext context,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookDetails(
          title: '${AppLocalizations.of(context)!.detailName}: ',
          content: bookModel.title,
        ),
        BookDetails(
          title: '${AppLocalizations.of(context)!.detailPublisher}: ',
          content: bookModel.publisher,
        ),
        BookDetails(
          title: '${AppLocalizations.of(context)!.detailYear}: ',
          content: bookModel.year.toString(),
        ),
        BookDetails(
          title: '${AppLocalizations.of(context)!.detailPage}: ',
          content: bookModel.pages.toString(),
        ),
        BookDetails(
          title: '${AppLocalizations.of(context)!.detailISBN}: ',
          content: bookModel.isbn,
        ),
      ],
    ),
  );
}
