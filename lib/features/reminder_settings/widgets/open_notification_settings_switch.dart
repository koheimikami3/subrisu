import 'package:flutter/cupertino.dart';

import '../../../importer.dart';

/// 端末の通知設定を開くスイッチ
class OpenNotificationSettingsSwitch extends StatelessWidget {
  const OpenNotificationSettingsSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: CupertinoSwitch(
        value: true,
        activeTrackColor: AppColors.primary,
        onChanged: (_) async {
          // 端末の通知設定画面を開く
          await AppSettings.openAppSettings(type: AppSettingsType.notification);
        },
      ),
    );
  }
}
