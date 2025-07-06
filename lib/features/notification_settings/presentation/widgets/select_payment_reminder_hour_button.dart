import 'package:intl/intl.dart';

import '../../../../importer.dart';

/// 支払いリマインダーの「何時に通知するか」を選択するボタン
class SelectPaymentReminderHourButton extends ConsumerWidget {
  const SelectPaymentReminderHourButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultHour = ref.watch(
      notificationSettingsPageNotifierProvider
          .select((state) => state.resultHour),
    );

    return ShowPickerButton(
      picker: const PaymentReminderHourPicker(),
      saveButton: const SavePaymentReminderHourButton(),
      text: DateFormat('HH:00').format(DateTime(0, 0, 0, resultHour)),
    );
  }
}
