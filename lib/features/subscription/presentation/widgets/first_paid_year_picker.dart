import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

// / 初回支払い年を選択するPicker
class FirstPaidYearPicker extends ConsumerWidget {
  const FirstPaidYearPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedYear = ref.watch(
      subscriptionFormNotifierProvider
          .select((state) => state.selectedFirstPaidYear),
    );

    // 1990年から2030年までのリストを生成
    final yearList = <int>[for (var i = 1990; i <= 2030; i++) i];

    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: yearList.indexOf(selectedYear),
      ),
      onSelectedItemChanged: (value) {
        // Pickerで選択中の初回支払い年の状態を更新
        ref
            .read(subscriptionFormNotifierProvider.notifier)
            .setSelectedFirstPaidYear(yearList[value]);
      },
      children: [
        for (int i = 0; i < yearList.length; i++) ...{
          Center(
            child: Text(
              AppLocalizations.of(context)!.firstPaidYear(yearList[i]),
            ),
          ),
        },
      ],
    );
  }
}
