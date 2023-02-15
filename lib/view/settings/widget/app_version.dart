import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリバージョン項目を表示する
class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final packageInfo = GetIt.I<PackageInfo>();

    return Column(
      children: [
        const ItemsTitle(title: texts.appVersionTitle),
        SettingItem(
          independenceItem: true,
          leadingIcon: Icons.info_outline,
          itemName: texts.appVersionItem,
          trailing: Text(packageInfo.version),
          onTap: null,
        ),
      ],
    );
  }
}
