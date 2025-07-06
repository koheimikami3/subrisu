import '../../../../importer.dart';

/// Pickerで選択した支払いリマインダーの「何日前に通知するか」を保存するボタン
class SavePaymentReminderDaysBeforeButton extends ConsumerWidget {
  const SavePaymentReminderDaysBeforeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavePickerValueButton(
      onPressed: () {
        // Pickerで選択中の「何日前に通知するか」の状態を更新
        ref
            .read(notificationSettingsPageNotifierProvider.notifier)
            .setResultDaysBefore();
      },
    );
  }
}
