import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/currency_settings/currency_settings_page.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 通貨設定画面に遷移するタイル
class GoToCurrencySettingsPageTile extends StatelessWidget {
  const GoToCurrencySettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.bottom,
      name: AppLocalizations.of(context)!.currencyItem,
      leadingIcon: Icons.currency_yen_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const CurrencySettingsPage()),
        );
      },
    );
  }
}
