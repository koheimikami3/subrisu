import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/constants/app_urls.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

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
