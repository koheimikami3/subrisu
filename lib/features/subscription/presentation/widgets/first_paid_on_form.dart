import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// 利用開始日フォームを表示する
class FirstPaidOnForm extends ConsumerWidget {
  const FirstPaidOnForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = ref.watch(
      subscriptionFormNotifierProvider
          .select((state) => state.resultFirstPaidDate),
    );

    return DetailItem(
      title: AppLocalizations.of(context)!.firstPaymentDateTitle,
      content: GestureDetector(
        onTap: () {
          // Pickerで選択中の初回支払い日の状態をリセット
          // 選択確定した日付に設定
          ref.read(subscriptionFormNotifierProvider.notifier)
            ..setSelectedFirstPaidYear(dateTime.year)
            ..setSelectedFirstPaidMonth(dateTime.month)
            ..setSelectedFirstPaidDay(dateTime.day);

          showCupertinoModalPopup<void>(
            context: context,
            builder: (_) {
              return CupertinoPickerSheet(
                picker: Localizations.localeOf(context) ==
                        Locale(LanguageSettings.english.code)
                    ? const Row(
                        children: [
                          Expanded(child: FirstPaidMonthPicker()),
                          Expanded(child: FirstPaidDayPicker()),
                          Expanded(child: FirstPaidYearPicker()),
                        ],
                      )
                    : const Row(
                        children: [
                          Expanded(child: FirstPaidYearPicker()),
                          Expanded(child: FirstPaidMonthPicker()),
                          Expanded(child: FirstPaidDayPicker()),
                        ],
                      ),
                saveButton: const SaveFirstPaidDateButton(),
              );
            },
          );
        },
        child: Row(
          children: [
            Text(AppLocalizations.of(context)!.firstPaidOn(dateTime)),
            Icon(
              Icons.unfold_more,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
