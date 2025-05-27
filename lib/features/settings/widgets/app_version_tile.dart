import '../../../importer.dart';

/// アプリバージョンを表示するタイル
class AppVersionTile extends ConsumerWidget {
  const AppVersionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.read(packageInfoProvider);

    return MyListTile(
      position: ItemPosition.bottom,
      leadingIcon: Icons.info_outline,
      name: AppLocalizations.of(context)!.appVersionItem,
      trailing: Text(packageInfo.version),
    );
  }
}
