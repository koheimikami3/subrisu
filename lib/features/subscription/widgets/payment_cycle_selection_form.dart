import 'package:flutter/cupertino.dart';

import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 支払い周期を選択するフォーム
class PaymentCycleSelectionForm extends ConsumerStatefulWidget {
  const PaymentCycleSelectionForm({
    super.key,
    this.paymentCycle,
  });

  final int? paymentCycle;

  @override
  ConsumerState<PaymentCycleSelectionForm> createState() =>
      _PaymentCycleSelectionFormState();
}

class _PaymentCycleSelectionFormState
    extends ConsumerState<PaymentCycleSelectionForm> {
  final _textList = texts.paymentCycleList;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();

    if (widget.paymentCycle != null) {
      _selectedIndex = widget.paymentCycle!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: texts.paymentCycleTitle,
      content: _selectButton(),
    );
  }

  /// 支払い周期を選択するボタン
  Widget _selectButton() {
    final index = ref.watch(subscriptionFormNotifierProvider).paymentCycle;

    return GestureDetector(
      onTap: _onTap,
      child: Row(
        children: [
          Text(_textList[index]),
          Icon(
            Icons.unfold_more,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  /// 支払い周期を選択するPickerを呼び出す
  void _onTap() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        return CupertinoPickerSheet(
          picker: _picker(),
          saveOnPressed: () {
            // 変更内容をプロバイダに保存
            ref
                .read(subscriptionFormNotifierProvider.notifier)
                .setPaymentCycle(_selectedIndex);

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
