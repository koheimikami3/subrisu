import '../../../importer.dart';

/// アプリバージョンを表示するタイル
class AppVersionTile extends ConsumerWidget {
  const AppVersionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.read(packageInfoProvider);

    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.appVersionTitle),
        MyListTile(
          position: ItemPosition.independence,
          leadingIcon: Icons.info_outline,
          name: AppLocalizations.of(context)!.appVersionItem,
          trailing: Text(packageInfo.version),
        ),
      ],
    );
  }
}
