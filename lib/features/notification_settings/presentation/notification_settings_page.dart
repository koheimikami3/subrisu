import 'package:flutter/material.dart';
import 'package:subrisu/features/notification_settings/presentation/notification_settings_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 通知設定画面
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.notificationSettingsPageTitle),
      ),
      body: const NotificationSettingsPageBody(),
    );
  }
}
