import '../../../constant/urls.dart' as urls;
import '../../../importer.dart';

/// アプリのシェアシートを呼び出すタイル
class ShowShareSheetTile extends StatelessWidget {
  const ShowShareSheetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.middle,
      name: AppLocalizations.of(context)!.shareItem,
      leadingIcon: Icons.share_outlined,
      onTap: () => Share.share('サブリス - サブスクと固定費をリストで管理\n${urls.appStoreUrl}'),
    );
  }
}
