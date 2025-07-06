import '../../../../importer.dart';

/// Pickerで選択した「何時に通知するか」を保存するボタン
class SaveReminderHourButton extends ConsumerWidget {
  const SaveReminderHourButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavePickerValueButton(
      onPressed: () {
        // Pickerで選択中の「何時に通知するか」の状態を更新
        ref.read(reminderSettingsPageNotiferProvider.notifier).setResultHour();
      },
    );
  }
}
