import '../../../../importer.dart';

/// サブスクリプション削除の確認ダイアログを表示するタイル
class DeleteSubscriptionButton extends StatelessWidget {
  const DeleteSubscriptionButton({
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
