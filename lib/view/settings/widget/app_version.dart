import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリバージョン項目のUIを作成する
class AppVersion extends ConsumerWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ItemsTitle(title: texts.appVersionTitle),
        SettingItem(
          independenceItem: true,
          leadingIcon: Icons.info_outline,
          itemName: texts.appVersionItem,
          trailing: _appVersion(ref),
          onTap: null,
        ),
      ],
    );
  }

  /// アプリバージョンを表示する
  Text _appVersion(WidgetRef ref) {
    final version = ref.watch(appVersionProvider);

    return Text(version);
  }
}
