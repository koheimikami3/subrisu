import 'package:flutter/cupertino.dart';

import '../../constant/colors.dart' as colors;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 通知フォームを表示する
class NotificationForm extends ConsumerWidget {
  const NotificationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DetailItem(
      title: texts.notificationTitle,
      content: _switch(ref),
      active: true,
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
