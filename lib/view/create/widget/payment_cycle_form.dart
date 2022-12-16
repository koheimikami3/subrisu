import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
            _selectButton(context),
            SizedBox(width: 15.w),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _selectButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) {
            return Container(
              height: 200.h,
              color: Colors.white,
              child: CupertinoPicker(
                itemExtent: 40.h,
                onSelectedItemChanged: (int value) {},
                scrollController: FixedExtentScrollController(initialItem: 2),
                children: const [
                  Center(child: Text('毎日')),
                  Center(child: Text('週に1回')),
                  Center(child: Text('1ヶ月に1回')),
                  Center(child: Text('3ヶ月に1回')),
                  Center(child: Text('6ヶ月に1回')),
                  Center(child: Text('年に1回')),
                ],
              ),
            );
          },
        );
      },
      child: const Text('1ヶ月に1回'),
    );
  }
}
