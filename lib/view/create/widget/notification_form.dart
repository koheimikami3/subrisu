import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../importer.dart';

/// 通知フォームを表示する
class NotificationForm extends ConsumerWidget {
  const NotificationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            const Text('前日に通知'),
            const Spacer(),
            _selectButton(ref),
            SizedBox(width: 15.w),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _selectButton(WidgetRef ref) {
    final isOn = ref.watch(notificationProvider);

    return SizedBox(
      height: 15.h,
      child: CupertinoSwitch(
        value: isOn,
        onChanged: (value) {
          ref.watch(notificationProvider.notifier).state = value;
        },
      ),
    );
  }
}
