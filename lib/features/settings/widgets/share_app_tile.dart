import '../../../importer.dart';

/// アプリのシェアシートを呼び出すタイル
class ShareAppTile extends StatelessWidget {
  const ShareAppTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.shareItem,
      leadingIcon: Icons.share_outlined,
      onTap: () => Share.share('サブリス - サブスクと固定費をリストで管理\n${AppUrls.appStore}'),
    );
  }
}
