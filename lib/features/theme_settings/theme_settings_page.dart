import 'package:flutter/material.dart';
import 'package:subrisu/features/theme_settings/theme_settings_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// テーマ設定画面
class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.themeSettingsPageTitle),
      ),
      body: const ThemeSettingsPageBody(),
    );
  }
}
