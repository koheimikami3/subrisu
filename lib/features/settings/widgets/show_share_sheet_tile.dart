import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// アプリのシェアシートを呼び出すタイル
class ShowShareSheetTile extends StatelessWidget {
  const ShowShareSheetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.middle,
      name: texts.shareItem,
      leadingIcon: Icons.share_outlined,
      onTap: () => Share.share(texts.shareText),
    );
  }
}
