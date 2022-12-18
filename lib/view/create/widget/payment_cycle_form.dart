import 'package:flutter/cupertino.dart';

import '../../../constant/configs.dart' as configs;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 支払い周期フォームを表示する
class PaymentCycleForm extends ConsumerWidget {
  const PaymentCycleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            const Text('支払い周期'),
            const Spacer(),
            _selectButton(context, ref),
            SizedBox(width: 15.w),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  /// 支払い周期を選択するボタン
  Widget _selectButton(BuildContext context, WidgetRef ref) {
    final index = ref.watch(resultPaymentCycleProvider);

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => _sheet(context, ref),
        );
      },
      child: Row(
        children: [
          Text(texts.paymentCycleList[index]),
          const Icon(Icons.unfold_more),
        ],
      ),
    );
  }

  /// 支払い周期を選択するシート
  Widget _sheet(BuildContext context, WidgetRef ref) {
    final index = ref.watch(resultPaymentCycleProvider);

    return Container(
      height: 200.h,
      color: Colors.white,
      child: Material(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 15.w),
                _cancelButton(context),
                const Spacer(),
                _saveButton(context, ref),
                SizedBox(width: 15.w),
              ],
            ),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40.h,
                onSelectedItemChanged: (value) {
                  ref.watch(selectPaymentCycleProvider.notifier).state = value;
                },
                scrollController:
                    FixedExtentScrollController(initialItem: index),
                children: [
                  for (int i = 0; i < texts.paymentCycleList.length; i++) ...{
                    Center(child: Text(texts.paymentCycleList[i])),
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 変更をキャンセルして閉じるボタン
  Widget _cancelButton(BuildContext context) {
    const text = 'キャンセル';

    return CupertinoTextButton(
      text: text,
      color: Colors.grey.shade800,
      onPressed: () => Navigator.pop(context),
    );
  }

  /// 変更を保存するボタン
  Widget _saveButton(BuildContext context, WidgetRef ref) {
    const text = '完了';

    return CupertinoTextButton(
      text: text,
      color: configs.appColor,
      onPressed: () {
        final index = ref.watch(selectPaymentCycleProvider);
        ref.watch(resultPaymentCycleProvider.notifier).state = index;

        Navigator.pop(context);
      },
    );
  }
}
