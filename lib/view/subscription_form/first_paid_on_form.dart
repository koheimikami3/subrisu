import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 利用開始日フォームを表示する
class FirstPaidOnForm extends ConsumerStatefulWidget {
  const FirstPaidOnForm({
    super.key,
    this.firstPaidOn,
  });

  final DateTime? firstPaidOn;

  @override
  ConsumerState<FirstPaidOnForm> createState() => _FirstPaidOnFormState();
}

class _FirstPaidOnFormState extends ConsumerState<FirstPaidOnForm> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    if (widget.firstPaidOn != null) {
      _selectedDateTime = widget.firstPaidOn!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: texts.firstPaymentDateTitle,
      content: _selectButton(),
    );
  }

  Widget _selectButton() {
    final dateTime = ref.watch(firstPaidOnProvider);
    final text = DateFormat.yMMMMd('ja').format(dateTime);

    return GestureDetector(
      onTap: _onTap,
      child: Row(
        children: [
          Text(text),
          Icon(
            Icons.unfold_more,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  /// 利用開始日を選択するPickerを呼び出す
  void _onTap() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        return CupertinoPickerSheet(
          picker: _picker(),
          saveOnPressed: _saveOnPressed,
        );
      },
    );
  }

  /// 変更内容をプロバイダに保存し、画面に反映する
  void _saveOnPressed() {
    // 変更内容をプロバイダに保存
    ref.watch(firstPaidOnProvider.notifier).state = _selectedDateTime;

    // Pickerを閉じる
    Navigator.pop(context);
  }

  /// 初回支払い日を選択するPicker
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
