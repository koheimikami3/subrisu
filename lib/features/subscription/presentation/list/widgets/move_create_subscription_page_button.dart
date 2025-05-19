import '../../../../../importer.dart';

/// サブスクリプション作成画面に遷移するボタン
class MoveCreateSubscriptionPageButton extends ConsumerWidget {
  const MoveCreateSubscriptionPageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseStatus = ref.watch(purchaseStatusNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: purchaseStatus == PurchaseStatus.inactive ? 50.h : 0,
      ),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => const CreateSubscriptionPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
