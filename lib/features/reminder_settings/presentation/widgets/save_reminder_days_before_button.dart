import '../../../../importer.dart';

/// Pickerで選択した「何日前に通知するか」を保存するボタン
class SaveReminderDaysBeforeButton extends ConsumerWidget {
  const SaveReminderDaysBeforeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        // Pickerで選択中の「何日前に通知するか」の状態を更新
        ref
            .read(reminderSettingsPageNotiferProvider.notifier)
            .setResultDaysBefore();

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
