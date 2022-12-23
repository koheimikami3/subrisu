import 'package:flutter/cupertino.dart';

import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 支払い周期フォームを表示する
class PaymentCycleForm extends ConsumerStatefulWidget {
  const PaymentCycleForm({Key? key}) : super(key: key);

  @override
  ConsumerState<PaymentCycleForm> createState() => _PaymentCycleFormState();
}

class _PaymentCycleFormState extends ConsumerState<PaymentCycleForm> {
  final _textList = texts.paymentCycleList;
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: texts.paymentCycleTitle,
      content: _selectButton(),
    );
  }

  /// 支払い周期を選択するボタン
  Widget _selectButton() {
    final index = ref.watch(paymentCycleProvider);

    return GestureDetector(
      onTap: () => _onTap(),
      child: Row(
        children: [
          Text(_textList[index]),
          const Icon(Icons.unfold_more),
        ],
      ),
    );
  }

  /// 支払い周期を選択するPickerを呼び出す
  void _onTap() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoPickerSheet(
          picker: _picker(),
          saveOnPressed: () {
            // 変更内容をプロバイダに保存
            ref.watch(paymentCycleProvider.notifier).state = _selectedIndex;

            // Pickerを閉じる
            Navigator.pop(context);
          },
        );
      },
    );
  }

  /// 支払い周期を選択するPicker
  Widget _picker() {
    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: _selectedIndex,
      ),
      onSelectedItemChanged: (value) {
        _selectedIndex = value;
      },
      children: [
        for (int i = 0; i < _textList.length; i++) ...{
          Center(child: Text(_textList[i])),
        },
      ],
    );
  }
}
