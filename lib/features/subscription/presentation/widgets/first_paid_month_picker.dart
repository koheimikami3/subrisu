import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../importer.dart';

// 初回支払い月を選択するPicker
class FirstPaidMonthPicker extends ConsumerWidget {
  const FirstPaidMonthPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(
      subscriptionFormNotifierProvider
          .select((state) => state.selectedFirstPaidMonth),
    );
    final monthList = <int>[for (var i = 1; i <= 12; i++) i];

    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: monthList.indexOf(selectedMonth),
      ),
      onSelectedItemChanged: (value) {
        // Pickerで選択中の初回支払い月の状態を更新
        ref
            .read(subscriptionFormNotifierProvider.notifier)
            .setSelectedFirstPaidMonth(monthList[value]);
      },
      children: [
        for (int i = 0; i < monthList.length; i++) ...{
          Center(
            child: Text(
              Localizations.localeOf(context) ==
                      Locale(LanguageSettings.english.code)
                  ? DateFormat.MMMM().format(DateTime(monthList[i]))
                  : AppLocalizations.of(context)!.firstPaidMonth(monthList[i]),
            ),
          ),
        },
      ],
    );
  }
}
