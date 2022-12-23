import 'dart:math';

import 'package:timezone/timezone.dart' as tz;

import '../importer.dart';

class NotificationScheduler {
  static Future<int> set(WidgetRef ref) async {
    final flnp = FlutterLocalNotificationsPlugin();
    final serviceName = ref.watch(serviceNameProvider);
    final paymentCycle = ref.watch(paymentCycleProvider);
    final startDate = ref.watch(firstPaymentDateProvider);
    final notificationId = Random().nextInt(1000000);
    late final DateTimeComponents components;

    switch (paymentCycle) {
      case 0:
        components = DateTimeComponents.time;
        break;
      case 1:
        components = DateTimeComponents.dayOfWeekAndTime;
        break;
      case 2:
        components = DateTimeComponents.dayOfMonthAndTime;
        break;
      case 3:
        components = DateTimeComponents.dateAndTime;
        break;
    }

    // 初回支払日の前日を通知日に設定
    final notificationDate = startDate.add(const Duration(days: -1));

    // 通知ひを日本タイムゾーンの日時に変換
    final scheduleDate = tz.TZDateTime.from(notificationDate, tz.local);

    await flnp.zonedSchedule(
      notificationId,
      'サブリス',
      '$serviceNameの支払い前日になりました。',
      scheduleDate,
      const NotificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: components,
    );

    return notificationId;
  }

  static Future<void> cancel(int? notificationId) async {
    if (notificationId == null) return;

    final flnp = FlutterLocalNotificationsPlugin();
    await flnp.cancel(notificationId);
  }
}
