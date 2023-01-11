import 'package:flutter/cupertino.dart';

import '../../constant/colors.dart' as colors;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 通知フォームを表示する
class NotificationForm extends ConsumerWidget {
  const NotificationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);

    return Column(
      children: [
        const ItemsTitle(title: '通知'),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isDark ? colors.darkItemColor : Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Expanded(
                child: DetailItem(
                  title: texts.notificationTitle,
                  content: _switch(context, ref),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// プッシュ通知のオン・オフを選択するSwitch
  Widget _switch(BuildContext context, WidgetRef ref) {
    final messaging = FirebaseMessaging.instance;
    final isOn = ref.watch(notificationProvider);

    return SizedBox(
      height: 15.h,
      child: CupertinoSwitch(
        value: isOn,
        activeColor: colors.appColor,
        onChanged: (value) async {
          // プッシュ通知の設定状況を取得
          final result = await messaging.getNotificationSettings();
          final status = result.authorizationStatus;

          // スイッチをオンにしようとしているかつ
          // プッシュ通知の設定がオフになっている場合、通知設定ダイアログを表示
          if (value == true && status == AuthorizationStatus.denied) {
            await showCupertinoDialog<void>(
              context: context,
              builder: (_) => const NotificationSettingDialog(),
            );
          } else {
            ref.watch(notificationProvider.notifier).state = value;
          }
        },
      ),
    );
  }
}
