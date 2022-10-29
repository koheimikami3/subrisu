import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリ設定項目リストのUIを作成する
class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: texts.appSettingsTitle),
        SettingItem(
          topItem: true,
          itemName: texts.accountItem,
          leadingIcon: Icons.account_circle_outlined,
          onTap: () => _onTap(context),
        ),
        SettingItem(
          middleItem: true,
          itemName: texts.notificationItem,
          leadingIcon: Icons.notifications_outlined,
          onTap: () => _onTap(context),
        ),
        // Ver1.1.0で実装
        // SettingItem(
        //   middleItem: true,
        //   itemName: texts.appColorItem,
        //   leadingIcon: Icons.palette_outlined,
        //   onTap: () => _onTap(context),
        // ),
        SettingItem(
          bottomItem: true,
          itemName: texts.darkModeItem,
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
