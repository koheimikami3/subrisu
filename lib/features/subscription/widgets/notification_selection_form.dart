import 'package:flutter/cupertino.dart';

import '../../../constant/colors.dart' as colors;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 通知を選択するフォーム
class NotificationSelectionForm extends ConsumerWidget {
  const NotificationSelectionForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Column(
      children: [
        const ItemsTitle(title: '通知'),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isDarkMode ? colors.darkItemColor : Colors.white,
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
    final notification =
        ref.watch(subscriptionFormNotifierProvider).notification;

    return SizedBox(
      height: 15.h,
      child: CupertinoSwitch(
        value: notification,
        activeColor: colors.appColor,
        onChanged: (value) async {
          // プッシュ通知の設定状況を取得
          final result = await ref
              .read(firebaseMessagingProvider)
              .getNotificationSettings();

          // スイッチをオンにしようとしているかつ
          // プッシュ通知の設定がオフになっている場合、通知設定ダイアログを表示
          if (value &&
              result.authorizationStatus == AuthorizationStatus.denied) {
            await showCupertinoDialog<void>(
              context: context,
              builder: (_) => const NotificationSettingDialog(),
            );
          } else {
            ref
                .watch(subscriptionFormNotifierProvider.notifier)
                .setNotification(value);
          }
        },
      ),
    );
  }
}
