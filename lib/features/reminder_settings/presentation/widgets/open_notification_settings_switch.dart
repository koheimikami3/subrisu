import 'package:flutter/cupertino.dart';

import '../../../../importer.dart';

/// 端末の通知設定を開くスイッチ
class OpenNotificationSettingsSwitch extends ConsumerWidget {
  const OpenNotificationSettingsSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIsEnabled = ref.watch(reminderIsEnabledProvider);

    return SizedBox(
      height: 15.h,
      child: asyncIsEnabled.when(
        loading: _indicator,
        error: (_, __) => const SizedBox.shrink(),
        data: (isEnabled) {
          return CupertinoSwitch(
            value: isEnabled ?? true,
            activeTrackColor: AppColors.primary,
            onChanged: (value) async {
              // リマインド通知の有効/無効を更新
              await ref.read(updateReminderIsEnabledProvider(value).future);

              // 端末の通知設定画面を開く
              // await AppSettings.openAppSettings(
              //   type: AppSettingsType.notification,
              // );
            },
          );
        },
      ),
    );
  }

  CircularProgressIndicator _indicator() {
    return CircularProgressIndicator(
      strokeWidth: 2,
      constraints: BoxConstraints(
        minHeight: 13.h,
        minWidth: 13.h,
      ),
    );
  }
}
