import '../../../../importer.dart';

/// Pickerで選択した「何時に通知するか」を保存するボタン
class SaveReminderHourButton extends ConsumerWidget {
  const SaveReminderHourButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        // Pickerで選択中の「何時に通知するか」の状態を更新
        ref.read(reminderSettingsPageNotiferProvider.notifier).setResultHour();

        // Pickerを閉じる
        Navigator.pop(context);
      },
      child: Text(
        AppLocalizations.of(context)!.pickerSaveButton,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
