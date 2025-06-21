import '../../importer.dart';

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
