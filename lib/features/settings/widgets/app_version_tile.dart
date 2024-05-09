import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリバージョンを表示するタイル
class AppVersionTile extends ConsumerWidget {
  const AppVersionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.read(packageInfoProvider);

    return Column(
      children: [
        const ItemsTitle(title: texts.appVersionTitle),
        MyListTile(
          position: ItemPosition.independence,
          leadingIcon: Icons.info_outline,
          name: texts.appVersionItem,
          trailing: Text(packageInfo.version),
        ),
      ],
    );
  }
}
