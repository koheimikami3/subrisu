import 'package:flutter/material.dart';
import 'package:subrisu/components/items_title.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/purchase/purchase_page.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 課金画面に遷移するタイル
class GoToPurchasePageTile extends StatelessWidget {
  const GoToPurchasePageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.purchaseItemsTitle),
        MyListTile(
          position: TilePosition.independence,
          leadingIcon: Icons.hide_image_outlined,
          name: AppLocalizations.of(context)!.purchaseItem,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const PurchasePage()),
            );
          },
        ),
      ],
    );
  }
}
