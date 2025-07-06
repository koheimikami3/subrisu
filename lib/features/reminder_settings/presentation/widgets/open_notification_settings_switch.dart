import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// 端末の通知設定を開くスイッチ
class OpenNotificationSettingsSwitch extends ConsumerWidget {
  const OpenNotificationSettingsSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(
      reminderSettingsPageNotiferProvider.select((state) => state.isEnabled),
    );

    return SizedBox(
      height: 15.h,
      child: CupertinoSwitch(
        value: isEnabled,
        activeTrackColor: AppColors.primary,
        onChanged: (value) {
          // リマインド通知の有効/無効を更新
          ref
              .read(reminderSettingsPageNotiferProvider.notifier)
              .setIsEnabled(value);

          // 端末の通知設定画面を開く
          // await AppSettings.openAppSettings(
          //   type: AppSettingsType.notification,
          // );
        },
      ),
    );
  }
}
