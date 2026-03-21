import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/constants/app_urls.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// アプリのシェアシートを呼び出すタイル
class ShareAppTile extends StatelessWidget {
  const ShareAppTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.shareItem,
      leadingIcon: Icons.share_outlined,
      onTap: () => Share.share(
        AppLocalizations.of(context)!.shareText(AppUrls.appStore),
      ),
    );
  }
}
