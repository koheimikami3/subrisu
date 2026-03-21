import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/notification_settings/presentation/notification_settings_page.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 通知設定画面に遷移するタイル
class GoToNotificationSettingsPageTile extends StatelessWidget {
  const GoToNotificationSettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.notificationItem,
      leadingIcon: Icons.notifications_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const NotificationSettingsPage(),
          ),
        );
      },
    );
  }
}
