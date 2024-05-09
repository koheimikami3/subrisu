import '../../../../importer.dart';

/// サブスクリプション削除ダイアログを呼び出すボタン
class ShowDeleteSubscriptionDialogButton extends StatelessWidget {
  const ShowDeleteSubscriptionDialogButton({
    super.key,
    required this.subscriptionId,
  });

  final String subscriptionId; // サブスクリプションID

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (_) {
            return DeleteSubscriptionDialog(subscriptionId: subscriptionId);
          },
        );
      },
      child: Container(
        height: 25.h,
        width: 25.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Icon(
          Icons.delete,
          size: 16.h,
          color: Colors.white,
        ),
      ),
    );
  }
}
