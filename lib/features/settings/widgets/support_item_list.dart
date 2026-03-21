import 'package:flutter/material.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/components/items_title.dart';
import 'package:subrisu/features/settings/widgets/app_version_tile.dart';
import 'package:subrisu/features/settings/widgets/open_app_review_tile.dart';
import 'package:subrisu/features/settings/widgets/open_inquiry_tile.dart';
import 'package:subrisu/features/settings/widgets/open_privacy_policy_tile.dart';
import 'package:subrisu/features/settings/widgets/open_terms_of_service_tile.dart';
import 'package:subrisu/features/settings/widgets/share_app_tile.dart';
import 'package:subrisu/l10n/app_localizations.dart';

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
