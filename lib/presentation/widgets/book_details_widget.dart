import 'package:book_reminder/pages/app_pages/book_detail_page.dart';
import 'package:book_reminder/presentation/widgets/common_widgets/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.all(10.r),
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
