import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tech_task/data/services/notification_service.dart';
import 'package:flutter_tech_task/models/book_model.dart';
import 'package:flutter_tech_task/presentation/providers/favorite_provider.dart';
import 'package:flutter_tech_task/presentation/widgets/book_list_view.dart';
import 'package:flutter_tech_task/presentation/widgets/common_widgets/common_body.dart';
import 'package:provider/provider.dart';

/// Favorilenen kitapların gösterimini sağlayan sayfa.
class FavoritesPage extends StatefulWidget {
  /// Sayfaya benzersiz key ataması.

  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return CustomBody(
      title: AppLocalizations.of(context)!.appBarFavorite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookListView(
              books: favoriteProvider.getAllFavorites(),
              trailingWidgetBuilder: (context, bookModel) {
                return IconButton(
                  icon: const Icon(Icons.alarm),
                  onPressed: () => _setNotification(
                    context: context,
                    bookModel: bookModel,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Bildirim alınması istenilen kitap için bildirim zamanlayıcının
  /// ayarlanması.
  Future<void> _setNotification({
    required BuildContext context,
    required BookModel bookModel,
  }) async {
    final selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectedTime != null) {
      if (context.mounted) {
        await NotificationService.scheduleDailyNotification(
          AppLocalizations.of(context)!.notificationTitle,
          '''
${AppLocalizations.of(context)!.notificationContent} ${bookModel.title}''',
          bookModel,selectedTime,
        );
      }
    }
  }
}
