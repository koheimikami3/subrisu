import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/constants/app_urls.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// お問い合わせをブラウザで開くタイル
class OpenInquiryTile extends StatelessWidget {
  const OpenInquiryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.inquiryItem,
      leadingIcon: Icons.mail_outline,
      onTap: () => launchUrl(Uri.parse(AppUrls.inquiry)),
    );
  }
}
