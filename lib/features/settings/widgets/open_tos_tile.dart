import '../../../constants/urls.dart' as urls;
import '../../../importer.dart';

/// 利用規約をブラウザで開くタイル
class OpenTosTile extends StatelessWidget {
  const OpenTosTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.middle,
      name: AppLocalizations.of(context)!.tosItem,
      leadingIcon: Icons.description_outlined,
      onTap: () => launchUrl(Uri.parse(urls.tosUrl)),
    );
  }
}
