import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

// 初回支払い日にちを選択するPicker
class FirstPaidDayPicker extends ConsumerWidget {
  const FirstPaidDayPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(
      subscriptionFormNotifierProvider
          .select((state) => state.selectedFirstPaidDay),
    );
    final dayList = ref.watch(
      subscriptionFormNotifierProvider.select((state) => state.dayList),
    );

    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: dayList.indexOf(selectedDay),
      ),
      onSelectedItemChanged: (value) {
        // Pickerで選択中の初回支払い日にちの状態を更新
        ref
            .read(subscriptionFormNotifierProvider.notifier)
            .setSelectedFirstPaidDay(dayList[value]);
      },
      children: [
        for (int i = 0; i < dayList.length; i++) ...{
          Center(
            child: Text(
              AppLocalizations.of(context)!.firstPaidDay(dayList[i]),
            ),
          ),
        },
      ],
    );
  }
}
