import '../../../constants/urls.dart' as urls;
import '../../../importer.dart';

/// 利用規約をブラウザで開くタイル
class OpenTermsOfServiceTile extends StatelessWidget {
  const OpenTermsOfServiceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.termsOfServiceItem,
      leadingIcon: Icons.description_outlined,
      onTap: () => launchUrl(Uri.parse(urls.termsOfServiceUrl)),
    );
  }
}
