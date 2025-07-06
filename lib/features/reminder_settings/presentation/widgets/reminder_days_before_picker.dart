import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// リマインダーの「支払い日の何日前に通知するか」を選択するPicker
class ReminderDaysBeforePicker extends ConsumerWidget {
  const ReminderDaysBeforePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const options = AppConfigs.reminderDaysBeforeOptions;
    final resultDaysBefore = ref.watch(
      reminderSettingsPageNotiferProvider
          .select((state) => state.resultDaysBefore),
    );

    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: resultDaysBefore,
      ),
      onSelectedItemChanged: (value) {
        ref
            .read(reminderSettingsPageNotiferProvider.notifier)
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
