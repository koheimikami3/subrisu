import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// サポート項目リスト
class SupportItemList extends StatelessWidget {
  const SupportItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ItemsTitle(title: texts.supportItemsTitle),
        OpenReviewTile(),
        ItemDivider(),
        ShowShareSheetTile(),
        ItemDivider(),
        OpenInquiryTile(),
        ItemDivider(),
        OpenTosTile(),
        ItemDivider(),
        OpenPrivacyPolicyTile(),
      ],
    );
  }
}
