import 'package:flutter/cupertino.dart';

import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリ設定項目リストのUIを作成する
class Apps extends ConsumerWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSetting = ref.watch(themeSettingNotifierProvider);
    late final String text;

    // テーマ設定に応じたテキストを設定
    if (themeSetting == ThemeSetting.device) {
      text = texts.deviceSettingItem;
    } else if (themeSetting == ThemeSetting.light) {
      text = texts.lightSettingItem;
    } else if (themeSetting == ThemeSetting.dark) {
      text = texts.darkSettingItem;
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
          settingText: text,
          onTap: () => Navigator.pushNamed(context, '/darkMode'),
        ),
      ],
    );
  }
}
