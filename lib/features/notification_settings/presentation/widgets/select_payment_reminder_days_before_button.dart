import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/show_picker_button.dart';
import 'package:subrisu/features/notification_settings/presentation/notification_settings_page_provider.dart';
import 'package:subrisu/features/notification_settings/presentation/widgets/payment_reminder_days_before_picker.dart';
import 'package:subrisu/features/notification_settings/presentation/widgets/save_payment_reminder_days_before_button.dart';
import 'package:subrisu/l10n/app_localizations.dart';

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
