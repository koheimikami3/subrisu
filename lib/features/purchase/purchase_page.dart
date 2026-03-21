import 'package:flutter/material.dart';
import 'package:subrisu/features/purchase/purchase_page_body.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 課金画面
class PurchasePage extends StatelessWidget {
  const PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.purchasePageTitle),
      ),
      body: const PurchasePageBody(),
    );
  }
}
