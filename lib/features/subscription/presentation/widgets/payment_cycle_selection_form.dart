import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// 支払い周期を選択するフォーム
class PaymentCycleSelectionForm extends ConsumerStatefulWidget {
  const PaymentCycleSelectionForm({
    super.key,
    this.paymentCycle,
  });

  final PaymentCycle? paymentCycle;

  @override
  ConsumerState<PaymentCycleSelectionForm> createState() =>
      _PaymentCycleSelectionFormState();
}

class _PaymentCycleSelectionFormState
    extends ConsumerState<PaymentCycleSelectionForm> {
  PaymentCycle _selectedItem = PaymentCycle.monthly;

  @override
  void initState() {
    super.initState();

    if (widget.paymentCycle != null) {
      _selectedItem = widget.paymentCycle!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DetailItem(
      title: AppLocalizations.of(context)!.paymentCycleTitle,
      content: _selectButton(),
    );
  }

  /// 支払い周期を選択するボタン
  Widget _selectButton() {
    final paymentCycle =
        ref.watch(subscriptionFormNotifierProvider).paymentCycle;

    return GestureDetector(
      onTap: _onTap,
      child: Row(
        children: [
          Text(AppLocalizations.of(context)!.paymentCycle(paymentCycle.name)),
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
          saveButton: TextButton(
            onPressed: () {
              ref
                  .read(subscriptionFormNotifierProvider.notifier)
                  .setPaymentCycle(_selectedItem);

              // Pickerを閉じる
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.pickerSaveButton,
              style: TextStyle(
                fontSize: 15.5.sp,
                color: AppColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }

  /// 支払い周期を選択するPicker
  Widget _picker() {
    return CupertinoPicker(
      itemExtent: 40.h,
      scrollController: FixedExtentScrollController(
        initialItem: _selectedItem.index,
      ),
      onSelectedItemChanged: (index) {
        _selectedItem = PaymentCycle.values[index];
      },
      children: [
        for (final paymentCycle in PaymentCycle.values) ...{
          Center(
            child: Text(
              AppLocalizations.of(context)!.paymentCycle(paymentCycle.name),
            ),
          ),
        },
      ],
    );
  }
}
