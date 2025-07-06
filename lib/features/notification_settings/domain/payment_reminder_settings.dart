import '../../../../importer.dart';

part 'payment_reminder_settings.freezed.dart';

/// UserDocumentのnotification.paymentReminderのフィールドデータを格納するモデルクラス
@freezed
abstract class PaymentReminderSettings implements _$PaymentReminderSettings {
  const factory PaymentReminderSettings({
    // 通知が有効かどうか
    required bool isEnabled,

    // 何日前に通知するか
    required int daysBefore,

    // 何時に通知するか
    required int hour,
  }) = _PaymentReminderSettings;
  const PaymentReminderSettings._();

  factory PaymentReminderSettings.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data()!;
    final notifications =
        data[FirestoreConstants.notificationsField] as Map<String, dynamic>?;
    final paymentReminder =
        notifications?[FirestoreConstants.paymentReminderField]
            as Map<String, dynamic>?;
    return PaymentReminderSettings(
      isEnabled:
          paymentReminder?[FirestoreConstants.isEnabled] as bool? ?? true,
      daysBefore:
          paymentReminder?[FirestoreConstants.daysBeforeField] as int? ??
              AppConfigs.defaultReminderDaysBefore,
      hour: paymentReminder?[FirestoreConstants.hourField] as int? ??
          AppConfigs.defaultReminderHour,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'isEnabled': isEnabled,
      'daysBefore': daysBefore,
      'hour': hour,
    };
  }
}
