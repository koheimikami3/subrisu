import '../../../importer.dart';

/// サポート項目リスト
class SupportItemList extends StatelessWidget {
  const SupportItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.supportItemsTitle),
        const OpenAppReviewTile(),
        const ItemDivider(),
        const ShareAppTile(),
        const ItemDivider(),
        const OpenInquiryTile(),
        const ItemDivider(),
        const OpenTermsOfServiceTile(),
        const ItemDivider(),
        const OpenPrivacyPolicyTile(),
        const ItemDivider(),
        const AppVersionTile(),
      ],
    );
  }
}
