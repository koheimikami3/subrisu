import '../../../constant/urls.dart' as urls;
import '../../../importer.dart';

/// お問い合わせをブラウザで開くタイル
class OpenInquiryTile extends StatelessWidget {
  const OpenInquiryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: ItemPosition.middle,
      name: AppLocalizations.of(context)!.inquiryItem,
      leadingIcon: Icons.mail_outline,
      onTap: () => launchUrl(Uri.parse(urls.inquiryUrl)),
    );
  }
}
