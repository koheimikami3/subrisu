import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/show_picker_button.dart';
import 'package:subrisu/constants/app_colors.dart';
import 'package:subrisu/enums/payment_cycle.dart';
import 'package:subrisu/features/subscription/presentation/subscription_form_provider.dart';
import 'package:subrisu/features/subscription/presentation/widgets/detail_item.dart';
import 'package:subrisu/l10n/app_localizations.dart';

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
    final paymentCycle =
        ref.watch(subscriptionFormNotifierProvider).paymentCycle;

    return DetailItem(
      title: AppLocalizations.of(context)!.paymentCycleTitle,
      content: ShowPickerButton(
        picker: CupertinoPicker(
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
        ),
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
        text: AppLocalizations.of(context)!.paymentCycle(paymentCycle.name),
      ),
    );
  }
}
