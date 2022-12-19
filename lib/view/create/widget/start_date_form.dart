import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 利用開始日フォームを表示する
class StartDateForm extends ConsumerStatefulWidget {
  const StartDateForm({Key? key}) : super(key: key);

  @override
  ConsumerState<StartDateForm> createState() => _StartDateFormState();
}

class _StartDateFormState extends ConsumerState<StartDateForm> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: texts.startDateTitle,
      content: _selectButton(),
    );
  }

  Widget _selectButton() {
    final dateTime = ref.watch(startDateProvider);
    late String text = '未選択';

    if (dateTime != null) text = DateFormat.yMMMMd('ja').format(dateTime);

    return GestureDetector(
      onTap: () => _onTap(),
      child: Row(
        children: [
          Text(text),
          const Icon(Icons.unfold_more),
        ],
      ),
    );
  }

  /// 利用開始日を選択するPickerを呼び出す
  void _onTap() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoPickerSheet(
          picker: _picker(),
          saveOnPressed: () {
            final paymentCycle = ref.watch(paymentCycleProvider);

            // 変更内容をプロバイダに保存
            ref.watch(startDateProvider.notifier).state = _selectedDateTime;

            switch (paymentCycle) {
              case 0:
                ref.watch(nextPaymentDateProvider.notifier).state = DateTime(
                  _selectedDateTime.year,
                  _selectedDateTime.month,
                  _selectedDateTime.day + 1,
                );
                break;
              case 1:
                ref.watch(nextPaymentDateProvider.notifier).state = DateTime(
                  _selectedDateTime.year,
                  _selectedDateTime.month,
                  _selectedDateTime.day + 7,
                );
                break;
              case 2:
                ref.watch(nextPaymentDateProvider.notifier).state = DateTime(
                  _selectedDateTime.year,
                  _selectedDateTime.month + 1,
                  _selectedDateTime.day,
                );
                break;
              case 3:
                ref.watch(nextPaymentDateProvider.notifier).state = DateTime(
                  _selectedDateTime.year + 1,
                  _selectedDateTime.month,
                  _selectedDateTime.day,
                );
                break;
            }

            // Pickerを閉じる
            Navigator.pop(context);
          },
        );
      },
    );
  }

  /// 利用開始日を選択するPicker
  Widget _picker() {
    return CupertinoDatePicker(
      initialDateTime: _selectedDateTime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (value) {
        _selectedDateTime = value;
      },
    );
  }
}
