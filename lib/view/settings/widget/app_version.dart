import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリバージョン項目を表示する
class AppVersion extends ConsumerWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(appVersionProvider);

    return Column(
      children: [
        const ItemsTitle(title: texts.appVersionTitle),
        SettingItem(
          independenceItem: true,
          leadingIcon: Icons.info_outline,
          itemName: texts.appVersionItem,
          trailing: Text(version),
          onTap: null,
        ),
      ],
    );
  }
}
