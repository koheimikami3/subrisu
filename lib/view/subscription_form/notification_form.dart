import 'package:flutter/cupertino.dart';

import '../../constant/colors.dart' as colors;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 通知フォームを表示する
class NotificationForm extends ConsumerWidget {
  const NotificationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ItemsTitle(title: '通知'),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Expanded(
                child: DetailItem(
                  title: texts.notificationTitle,
                  content: _switch(ref),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 5.h),
        // Row(
        //   children: [
        //     SizedBox(width: 15.w),
        //     Expanded(
        //       child: Text(
        //         '支払い周期と初回支払い日から通知日を計算します。',
        //         style: TextStyle(
        //           fontSize: 12.5.sp,
        //           color: Colors.black54,
        //         ),
        //       ),
        //     ),
        //     SizedBox(width: 15.w),
        //   ],
        // ),
      ],
    );
  }

  /// プッシュ通知のオン・オフを選択するSwitch
  Widget _switch(WidgetRef ref) {
    final isOn = ref.watch(notificationProvider);

    return SizedBox(
      height: 15.h,
      child: CupertinoSwitch(
        value: isOn,
        activeColor: colors.appColor,
        onChanged: (value) {
          // 変更内容をプロバイダに保存
          ref.watch(notificationProvider.notifier).state = value;
        },
      ),
    );
  }
}
