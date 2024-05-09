import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリ設定項目リスト
class AppItemList extends StatelessWidget {
  const AppItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ItemsTitle(title: texts.appSettingsTitle),
        ShowOpenNotificationSettingsDialogTile(),
        ItemDivider(),
        MoveThemeSettingPageTile(),
      ],
    );
  }
}
