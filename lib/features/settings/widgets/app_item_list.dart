import 'package:flutter/material.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/components/items_title.dart';
import 'package:subrisu/features/settings/widgets/go_to_currency_settings_page_tile.dart';
import 'package:subrisu/features/settings/widgets/go_to_language_settings_page_tile.dart';
import 'package:subrisu/features/settings/widgets/go_to_notification_settings_page_tile.dart';
import 'package:subrisu/features/settings/widgets/go_to_theme_settings_page_tile.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// アプリ設定項目リスト
class AppItemList extends StatelessWidget {
  const AppItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.appSettingsTitle),
        const GoToNotificationSettingsPageTile(),
        const ItemDivider(),
        const GoToThemeSettingsPageTile(),
        const ItemDivider(),
        const GoToLanguageSettingsPageTile(),
        const ItemDivider(),
        const GoToCurrencySettingsPageTile(),
      ],
    );
  }
}
