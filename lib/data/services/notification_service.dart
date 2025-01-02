import 'dart:async';

import 'package:book_reminder/models/book_model.dart';
import 'package:book_reminder/pages/app_pages/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

/// [bookID] ile 'books' isimli [Hive] box içerisinden [BookModel] sorgusu
/// gerçekleştirme.
///
/// Sorgu sonrası ID' si eşleşen veriyi döndürme.
BookModel? getBookById(int bookID) {
  final box = Hive.box<BookModel>('books');

  return box.get(bookID);
}

/// [FlutterLocalNotificationsPlugin] ile lokal bazlı hatırlatıcı mesaj sınıfı
/// oluşturma.
class NotificationService {
  /// Bildirimleri yöneteceğimiz [FlutterLocalNotificationsPlugin] sınıfını
  /// çağırmak için oluşturduğumuz değişken.
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Bildirime tıklama sonrası [BookDetailPage] sayfasına yönlendirmeyi
  /// sağlayan key değişkeni.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// [FlutterLocalNotificationsPlugin] eklentisini uygulama açılırken
  /// çalıştırma ve uygulamaya entegrasyonunu sağlama.
  Future<void> init() async {
    const androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInitializationSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );
    await _requestNotificationPermissions();
  }

  Future<void> _requestNotificationPermissions() async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      debugPrint('Bildirim izni verildi.');
    } else {
      debugPrint('Bildirim izni verilmedi.');
    }
  }

  /// Uygulama foreground' da iken bildirim gelmesi takdirinde bildirime
  /// tıklandığında, bildirimde yer alan [BookModel] ile [BookDetailPage]
  /// sayfasına yönlendirme.
  static Future<void> onDidReceiveNotification(
    NotificationResponse notificationResponse,
  ) async {
    if (notificationResponse.payload != null) {
      final payload = notificationResponse.payload!;
      final bookModel = _getBookFromPayload(payload);

      if (bookModel != null) {
        unawaited(
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => BookDetailPage(bookModel: bookModel),
            ),
          ),
        );
      }
    }
  }

  /// Bildirimler için gerekli bildirim ayarlarının yapılandırılması ve
  /// bildirimin ayarlanan şekli ile gösterimini sağlama.
  static Future<void> showInstantNotification(
    String title,
    String body,
    BookModel book,
  ) async {
    const platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        'book_reminder',
        'Book Reminder',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    final payload = book.id.toString();

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  /// Kullanıcının zamanladığı saatte bildirimlerin gönderilmesini sağlayan
  /// fonksiyon.
  static Future<void> scheduleDailyNotification(
    String title,
    String body,
    BookModel book,
    TimeOfDay scheduledTime,
  ) async {
    final now = DateTime.now();
    var scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      scheduledTime.hour,
      scheduledTime.minute,
    );

    // Eğer seçilen zaman bugün için geçmişse, yarın için zamanla
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    final tzScheduledDate = tz.TZDateTime.from(scheduledDate, tz.local);

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'daily_book_reminder',
      'Daily Book Reminder',
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      book.id,
      title,
      body,
      tzScheduledDate,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: book.id.toString(),
    );
  }

  /// Bildirimin [payload] içerisinden, bildirime ait kitabın ID' sini alma ve
  /// bunu [getBookById] fonksiyonu ile [BookModel] verisine erişerek döndürme.
  static BookModel? _getBookFromPayload(String payload) {
    final bookId = int.tryParse(payload);

    if (bookId != null) {
      final book = getBookById(bookId);
      return book;
    }
    return null;
  }
}
