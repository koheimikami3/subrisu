import 'package:flutter/cupertino.dart';

import '../../../constant/configs.dart' as configs;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリ設定項目リストのUIを作成する
class Apps extends ConsumerWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    late final String themeText;

    // テーマ設定状況を取得
    if (theme == configs.deviceTheme) {
      themeText = texts.deviceSettingItem;
    }
    if (theme == configs.lightTheme) {
      themeText = texts.lightSettingItem;
    }
    if (theme == configs.darkTheme) {
      themeText = texts.darkSettingItem;
    }

    return Column(
      children: [
        const ItemsTitle(title: texts.appSettingsTitle),
        SettingItem(
          topItem: true,
          itemName: texts.notificationItem,
          leadingIcon: Icons.notifications_outlined,
          trailing: const SizedBox.shrink(),
          onTap: () {
            showCupertinoDialog<void>(
              context: context,
              builder: (_) => const NotificationSettingDialog(),
            );
          },
        ),
        SettingItem(
          bottomItem: true,
          itemName: texts.darkModeItem,
          leadingIcon: Icons.dark_mode_outlined,
          settingText: themeText,
          onTap: () => Navigator.pushNamed(context, '/darkMode'),
        ),
      ],
    );
  }
}
