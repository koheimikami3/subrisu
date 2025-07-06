import '../../../../importer.dart';

/// 支払いリマインダーの「何日前に通知するか」を選択するボタン
class SelectPaymentReminderDaysBeforeButton extends ConsumerWidget {
  const SelectPaymentReminderDaysBeforeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultDaysBefore = ref.watch(
      notificationSettingsPageNotifierProvider
          .select((state) => state.resultDaysBefore),
    );

    return ShowPickerButton(
      picker: const PaymentReminderDaysBeforePicker(),
      saveButton: const SavePaymentReminderDaysBeforeButton(),
      text: AppLocalizations.of(context)!.reminderDaysBefore(
        resultDaysBefore.toString(),
      ),
    );
  }
}
