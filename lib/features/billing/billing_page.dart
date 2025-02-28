import '../../importer.dart';

/// 課金画面
class BillingPage extends ConsumerWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.billingPageTitle)),
      body: const BillingPageBody(),
    );
  }
}
