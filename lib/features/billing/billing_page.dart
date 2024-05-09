import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 課金画面
class BillingPage extends ConsumerWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text(texts.billingPageTitle)),
      body: const BillingPageBody(),
    );
  }
}
