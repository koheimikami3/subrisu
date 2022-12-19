import 'package:flutter/cupertino.dart';

import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 支払い方法フォームを表示する
class PaymentMethodForm extends ConsumerStatefulWidget {
  const PaymentMethodForm({Key? key}) : super(key: key);

  @override
  ConsumerState<PaymentMethodForm> createState() => _PaymentMethodFormState();
}

class _PaymentMethodFormState extends ConsumerState<PaymentMethodForm> {
  final _textList = texts.paymentMethodList;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: texts.paymentMethodTitle,
      content: _selectButton(),
    );
  }

  /// 支払い方法を選択するボタン
  Widget _selectButton() {
    final index = ref.watch(paymentMethodProvider);

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

  /// 支払い方法を選択するPickerを呼び出す
  void _onTap() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return CupertinoPickerSheet(
          picker: _picker(),
          saveOnPressed: () {
            // 変更内容をプロバイダに保存
            ref.watch(paymentMethodProvider.notifier).state = _selectedIndex;

            // Pickerを閉じる
            Navigator.pop(context);
          },
        );
      },
    );
  }

  /// 支払い方法を選択するPicker
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
