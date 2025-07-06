import '../../../../importer.dart';

/// Pickerで選択した支払いリマインダーの「何時に通知するか」を保存するボタン
class SavePaymentReminderHourButton extends ConsumerWidget {
  const SavePaymentReminderHourButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavePickerValueButton(
      onPressed: () {
        // Pickerで選択中の「何時に通知するか」の状態を更新
        ref
            .read(notificationSettingsPageNotifierProvider.notifier)
            .setResultHour();
      },
    );
  }
}
