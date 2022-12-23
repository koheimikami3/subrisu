import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 利用開始日フォームを表示する
class FirstPaymentDateForm extends ConsumerStatefulWidget {
  const FirstPaymentDateForm({Key? key}) : super(key: key);

  @override
  ConsumerState<FirstPaymentDateForm> createState() =>
      _FirstPaymentDateFormState();
}

class _FirstPaymentDateFormState extends ConsumerState<FirstPaymentDateForm> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: texts.firstPaymentDateTitle,
      content: _selectButton(),
    );
  }

  Widget _selectButton() {
    final dateTime = ref.watch(firstPaymentDateProvider);
    final text = DateFormat.yMMMMd('ja').format(dateTime);

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
          saveOnPressed: () => _saveOnPressed(),
        );
      },
    );
  }

  /// 変更内容をプロバイダに保存し、画面に反映する
  void _saveOnPressed() {
    final result = DateTime(
      _selectedDateTime.year,
      _selectedDateTime.month,
      _selectedDateTime.day,
    );

    // 変更内容をプロバイダに保存
    ref.watch(firstPaymentDateProvider.notifier).state = result;

    // Pickerを閉じる
    Navigator.pop(context);
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
