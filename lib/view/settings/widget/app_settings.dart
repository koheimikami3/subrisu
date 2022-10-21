import 'package:subrisu/importer.dart';

/// アプリ設定項目リストのUIを作成する
class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: Texts.appSettingsTitle),
        SettingItem(
          topItem: true,
          itemName: Texts.accountItem,
          leadingIcon: Icons.account_circle_outlined,
          onTap: () => _onTap(context),
        ),
        SettingItem(
          middleItem: true,
          itemName: Texts.notificationItem,
          leadingIcon: Icons.notifications_outlined,
          onTap: () => _onTap(context),
        ),
        SettingItem(
          middleItem: true,
          itemName: Texts.appColorItem,
          leadingIcon: Icons.palette_outlined,
          onTap: () => _onTap(context),
        ),
        SettingItem(
          bottomItem: true,
          itemName: Texts.darkModeItem,
          leadingIcon: Icons.dark_mode_outlined,
          onTap: () => _onDarkModeTap(context),
        ),
      ],
    );
  }

  void _onTap(BuildContext context) {}

  /// ダークモード画面に遷移する
  void _onDarkModeTap(BuildContext context) {
    Navigator.pushNamed(context, '/darkMode');
  }
}
