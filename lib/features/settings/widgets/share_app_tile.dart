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
      onTap: () => Share.share(
        AppLocalizations.of(context)!.shareText(AppUrls.appStore),
      ),
    );
  }
}
