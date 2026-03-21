import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subrisu/components/save_picker_value_button.dart';
import 'package:subrisu/features/notification_settings/presentation/notification_settings_page_provider.dart';

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
