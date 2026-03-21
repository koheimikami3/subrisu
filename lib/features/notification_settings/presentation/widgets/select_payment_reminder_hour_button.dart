import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:subrisu/components/show_picker_button.dart';
import 'package:subrisu/features/notification_settings/presentation/notification_settings_page_provider.dart';
import 'package:subrisu/features/notification_settings/presentation/widgets/payment_reminder_hour_picker.dart';
import 'package:subrisu/features/notification_settings/presentation/widgets/save_payment_reminder_hour_button.dart';

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
