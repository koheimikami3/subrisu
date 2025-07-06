import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// リマインダーの「何時に通知するか」を選択するPicker
class ReminderHourPicker extends ConsumerWidget {
  const ReminderHourPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultHour = ref.watch(
      reminderSettingsPageNotiferProvider.select((state) => state.resultHour),
    );
    final hourList = <int>[for (var i = 0; i <= 23; i++) i];

    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: hourList[resultHour],
      ),
      onSelectedItemChanged: (value) {
        ref
            .read(reminderSettingsPageNotiferProvider.notifier)
            .setSelectedHour(hourList[value]);
      },
      children: [
        for (int i = 0; i < hourList.length; i++) ...{
          Center(
            child: Text(i.toString()),
          ),
        },
      ],
    );
  }
}
