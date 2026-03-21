import 'package:flutter/material.dart';
import 'package:subrisu/features/subscription/presentation/create/create_subscription_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// サブスクリプション作成画面
class CreateSubscriptionPage extends StatelessWidget {
  const CreateSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context)!.createSubscriptionPageTitle),
        ),
        body: const CreateSubscriptionPageBody(),
      ),
    );
  }
}
