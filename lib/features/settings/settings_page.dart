import 'package:flutter/material.dart';
import 'package:subrisu/components/my_banner_ad.dart';
import 'package:subrisu/features/settings/settings_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 設定画面
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.settingsPageTitle)),
      body: const Column(
        children: [
          Expanded(child: SettingsPageBody()),
          MyBannerAd(),
        ],
      ),
    );
  }
}
