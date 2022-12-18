import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// 利用開始日フォームを表示する
class StartDateForm extends ConsumerWidget {
  const StartDateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            const Text('利用開始日'),
            const Spacer(),
            _selectButton(context, ref),
            SizedBox(width: 15.w),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _selectButton(BuildContext context, WidgetRef ref) {
    final dateTime = ref.watch(resultStartDateProvider);
    final text = DateFormat.yMMMMd('ja').format(dateTime);

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) {
            return Container(
              height: 200.h,
              color: Colors.white,
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
                    child: CupertinoDatePicker(
                      initialDateTime: dateTime,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) {
                        ref.watch(selectStartDateProvider.notifier).state =
                            value;
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          Text(text),
          const Icon(Icons.unfold_more),
        ],
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
        final dateTime = ref.watch(selectStartDateProvider);
        ref.watch(resultStartDateProvider.notifier).state = dateTime;

        Navigator.pop(context);
      },
    );
  }
}
