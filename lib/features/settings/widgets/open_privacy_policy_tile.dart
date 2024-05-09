import '../../../constant/texts.dart' as texts;
import '../../../constant/urls.dart' as urls;
import '../../../importer.dart';

/// プライバシーポリシーをブラウザで開くタイル
class OpenPrivacyPolicyTile extends StatelessWidget {
  const OpenPrivacyPolicyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.bottom,
      leadingIcon: Icons.verified_user_outlined,
      name: texts.privacyPolicyItem,
      onTap: () => launchUrl(Uri.parse(urls.privacyPolicyUrl)),
    );
  }
}
