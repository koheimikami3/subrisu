import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// 支払いリマインダーの「何日前に通知するか」を選択するPicker
class PaymentReminderDaysBeforePicker extends ConsumerWidget {
  const PaymentReminderDaysBeforePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const options = AppConfigs.reminderDaysBeforeOptions;
    final resultDaysBefore = ref.watch(
      notificationSettingsPageNotifierProvider
          .select((state) => state.resultDaysBefore),
    );

    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: resultDaysBefore,
      ),
      onSelectedItemChanged: (value) {
        ref
            .read(notificationSettingsPageNotifierProvider.notifier)
            .setSelectedDaysBefore(options[value]);
      },
      children: options.map((number) {
        return Center(
          child: Text(
            AppLocalizations.of(context)!.reminderDaysBefore(number.toString()),
          ),
        );
      }).toList(),
    );
  }
}
