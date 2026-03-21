import 'package:flutter/material.dart';
import 'package:subrisu/features/currency_settings/currency_settings_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 通貨設定画面
class CurrencySettingsPage extends StatelessWidget {
  const CurrencySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.currencySettingsPageTitle),
      ),
      body: const CurrencySettingsPageBody(),
    );
  }
}
