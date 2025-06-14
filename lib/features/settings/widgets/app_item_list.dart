import '../../../importer.dart';

/// アプリ設定項目リスト
class AppItemList extends StatelessWidget {
  const AppItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.appSettingsTitle),
        const OpenNotificationSettingsTile(),
        const ItemDivider(),
        const GoToThemeSettingsPageTile(),
        const ItemDivider(),
        const GoToLanguageSettingsPageTile(),
      ],
    );
  }
}
