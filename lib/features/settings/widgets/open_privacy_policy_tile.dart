import '../../../importer.dart';

/// プライバシーポリシーをブラウザで開くタイル
class OpenPrivacyPolicyTile extends StatelessWidget {
  const OpenPrivacyPolicyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      leadingIcon: Icons.verified_user_outlined,
      name: AppLocalizations.of(context)!.privacyPolicyItem,
      onTap: () => launchUrl(Uri.parse(AppUrls.privacyPolicy)),
    );
  }
}
