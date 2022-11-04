import '../../../constant/texts.dart' as texts;
import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// アプリ設定項目リストのUIを作成する
class AppSettings extends ConsumerWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeSettingProvider);
    final account = ref.watch(accountProvider);
    String accountText = 'ゲスト';
    String themeText = '';

    if (account == 'Google') accountText = 'Google';

    // テーマ設定状況を取得
    if (theme == configs.deviceTheme) themeText = texts.deviceSettingItem;
    if (theme == configs.lightTheme) themeText = texts.lightSettingItem;
    if (theme == configs.darkTheme) themeText = texts.darkSettingItem;

    return Column(
      children: [
        const ItemsTitle(title: texts.appSettingsTitle),
        SettingItem(
          topItem: true,
          itemName: texts.linkAccountItem,
          leadingIcon: Icons.account_circle_outlined,
          settingText: accountText,
          onTap: () => _linkAccountOnTap(context),
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
          settingText: themeText,
          onTap: () => _onDarkModeTap(context),
        ),
      ],
    );
  }

  void _onTap(BuildContext context) {}

  /// アカウント連携画面に遷移する
  void _linkAccountOnTap(BuildContext context) {
    Navigator.pushNamed(context, '/linkAccount');
  }

  /// ダークモード画面に遷移する
  void _onDarkModeTap(BuildContext context) {
    Navigator.pushNamed(context, '/darkMode');
  }
}
