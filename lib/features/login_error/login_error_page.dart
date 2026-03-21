import 'package:flutter/material.dart';
import 'package:subrisu/features/login_error/login_error_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// ログインエラー画面
class LoginErrorPage extends StatelessWidget {
  const LoginErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.loginErrorPageTitle),
      ),
      body: const LoginErrorPageBody(),
    );
  }
}
