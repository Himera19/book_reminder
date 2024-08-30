import 'package:flutter/cupertino.dart';

import 'package:flutter_tech_task/pages/app_pages/book_detail_page.dart';
import 'package:flutter_tech_task/presentation/widgets/common_widgets/common_text.dart';

/// [BookDetailPage] sayfası üzerinden sergilenen içeriklerin tasarımı.
class BookDetails extends StatelessWidget {
  /// Detayların doğru gösterim için gerekli değişkenlerin tanımlanması.

  const BookDetails({required this.title, required this.content, super.key});

  /// Detayın başlığının tanımlanması.
  final String title;

  /// Detayın içeriğinin tanımlanması.
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text.rich(
        TextSpan(
          children: [
            AppTextStyles.bookDetailTitleText(context: context, title: title),
            AppTextStyles.bookDetailContentText(
              context: context,
              title: content,
            ),
          ],
        ),
      ),
    );
  }
}
