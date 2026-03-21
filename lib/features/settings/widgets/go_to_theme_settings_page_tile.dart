import 'package:flutter/material.dart';
import 'package:subrisu/components/my_list_tile.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/theme_settings/theme_settings_page.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// テーマ設定画面に遷移するタイル
class GoToThemeSettingsPageTile extends StatelessWidget {
  const GoToThemeSettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.middle,
      name: AppLocalizations.of(context)!.themeItem,
      leadingIcon: Icons.dark_mode_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const ThemeSettingsPage()),
        );
      },
    );
  }
}
