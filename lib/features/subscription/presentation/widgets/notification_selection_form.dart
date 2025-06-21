import 'package:flutter/cupertino.dart';

import '../../../../constants/colors.dart' as colors;
import '../../../../importer.dart';

/// 通知を選択するフォーム
class NotificationSelectionForm extends ConsumerWidget {
  const NotificationSelectionForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.notificationTitle),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey.shade400),
            color: selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.white,
              darkColor: colors.darkItemColor,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Expanded(
                child: DetailItem(
                  title: AppLocalizations.of(context)!.reminderTitle,
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
        activeTrackColor: colors.appColor,
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
              builder: (_) => const OpenNotificationSettingsDialog(),
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
