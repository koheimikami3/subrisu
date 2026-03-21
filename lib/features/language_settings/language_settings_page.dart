import 'package:flutter/material.dart';
import 'package:subrisu/features/language_settings/language_settings_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 言語設定画面
class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languageSettingsPageTitle),
      ),
      body: const LanguageSettingsPageBody(),
    );
  }
}
