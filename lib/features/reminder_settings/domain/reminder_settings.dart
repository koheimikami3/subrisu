import '../../../../importer.dart';

part 'reminder_settings.freezed.dart';

/// UserDocumentのreminderフィールドデータを格納するモデルクラス
@freezed
abstract class ReminderSettings implements _$ReminderSettings {
  const factory ReminderSettings({
    // リマインダーを有効にするかどうか
    required bool isEnabled,

    // 何日前に通知するか
    required int daysBefore,

    // 何時に通知するか
    required int hour,
  }) = _ReminderSettings;
  const ReminderSettings._();

  factory ReminderSettings.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final data = snapshot.data()!;
    final reminder =
        data[FirestoreConstants.reminderField] as Map<String, dynamic>?;
    return ReminderSettings(
      isEnabled: reminder?[FirestoreConstants.isEnabled] as bool? ?? true,
      daysBefore: reminder?[FirestoreConstants.daysBeforeField] as int? ??
          AppConfigs.defaultReminderDaysBefore,
      hour: reminder?[FirestoreConstants.hourField] as int? ??
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
