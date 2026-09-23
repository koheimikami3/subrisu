import 'package:flutter/material.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/components/items_title.dart';
import 'package:subrisu/enums/author_app.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/settings/widgets/author_app_tile.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 作者の他のアプリ項目リスト
class AuthorAppItemList extends StatelessWidget {
  const AuthorAppItemList({super.key});

  @override
  Widget build(BuildContext context) {
    const apps = AuthorApp.values;

    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.authorAppsTitle),
        for (var i = 0; i < apps.length; i++) ...[
          if (i > 0) const ItemDivider(),
          AuthorAppTile(
            app: apps[i],
            position: i == 0
                ? TilePosition.top
                : i == apps.length - 1
                    ? TilePosition.bottom
                    : TilePosition.middle,
          ),
        ],
      ],
    );
  }
}
