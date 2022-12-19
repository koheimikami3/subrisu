import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 次回支払い日フォームを表示する
class NextPaymentDateForm extends ConsumerStatefulWidget {
  const NextPaymentDateForm({Key? key}) : super(key: key);

  @override
  ConsumerState<NextPaymentDateForm> createState() =>
      _NextPaymentDateFormState();
}

class _NextPaymentDateFormState extends ConsumerState<NextPaymentDateForm> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: texts.nextPaymentDateTitle,
      content: _selectButton(),
    );
  }

  Widget _selectButton() {
    final dateTime = ref.watch(nextPaymentDateProvider);
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

  /// 次回支払い日を選択するPickerを呼び出す
  void _onTap() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoPickerSheet(
          picker: _picker(),
          saveOnPressed: () {
            // 変更内容をプロバイダに保存
            ref.watch(nextPaymentDateProvider.notifier).state =
                _selectedDateTime;

            // Pickerを閉じる
            Navigator.pop(context);
          },
        );
      },
    );
  }

  /// 次回支払い日を選択するPicker
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
