import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// 支払いリマインダーの「何時に通知するか」を選択するPicker
class PaymentReminderHourPicker extends ConsumerWidget {
  const PaymentReminderHourPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultHour = ref.watch(
      notificationSettingsPageNotifierProvider
          .select((state) => state.resultHour),
    );
    final hourList = <int>[for (var i = 0; i <= 23; i++) i];

    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: hourList[resultHour],
      ),
      onSelectedItemChanged: (value) {
        ref
            .read(notificationSettingsPageNotifierProvider.notifier)
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
