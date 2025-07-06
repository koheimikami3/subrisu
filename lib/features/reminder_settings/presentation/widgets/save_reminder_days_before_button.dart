import '../../../../importer.dart';

/// Pickerで選択した「何日前に通知するか」を保存するボタン
class SaveReminderDaysBeforeButton extends ConsumerWidget {
  const SaveReminderDaysBeforeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavePickerValueButton(
      onPressed: () {
        // Pickerで選択中の「何日前に通知するか」の状態を更新
        ref
            .read(reminderSettingsPageNotiferProvider.notifier)
            .setResultDaysBefore();
      },
    );
  }
}
