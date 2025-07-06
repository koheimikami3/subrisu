import '../../../../importer.dart';

/// リマインダーの「何日前に通知するか」を選択するボタン
class SelecetDaysBeforeButton extends ConsumerWidget {
  const SelecetDaysBeforeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultDaysBefore = ref.watch(
      reminderSettingsPageNotiferProvider
          .select((state) => state.resultDaysBefore),
    );

    return ShowPickerButton(
      picker: const ReminderDaysBeforePicker(),
      saveButton: const SaveReminderDaysBeforeButton(),
      text: AppLocalizations.of(context)!.reminderDaysBefore(
        resultDaysBefore.toString(),
      ),
    );
  }
}
