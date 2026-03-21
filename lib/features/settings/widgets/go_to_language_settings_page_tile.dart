import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/language_settings/language_settings_page.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 言語設定画面に遷移するタイル
class GoToLanguageSettingsPageTile extends StatelessWidget {
  const GoToLanguageSettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.languageItem,
      leadingIcon: Icons.language_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const LanguageSettingsPage()),
        );
      },
    );
  }
}
