import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../importer.dart';

/// 利用開始日フォームを表示する
class StartDateForm extends ConsumerWidget {
  const StartDateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = DateTime.now();
    final text = DateFormat.yMMMMd('ja').format(dateTime);

    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            const Text('利用開始日'),
            const Spacer(),
            _selectButton(context, text),
            SizedBox(width: 15.w),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _selectButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) {
            return Container(
              height: 200.h,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {},
              ),
            );
          },
        );
      },
      child: Text(text),
    );
  }
}
