import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/constants/app_urls.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// 利用規約をブラウザで開くタイル
class OpenTermsOfServiceTile extends StatelessWidget {
  const OpenTermsOfServiceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.termsOfServiceItem,
      leadingIcon: Icons.description_outlined,
      onTap: () => launchUrl(Uri.parse(AppUrls.termsOfService)),
    );
  }
}
