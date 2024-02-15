import 'package:flutter/cupertino.dart';

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
    return InkWell(
      onTap: () {
        showCupertinoDialog<void>(
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
          CupertinoIcons.delete_solid,
          color: Colors.white,
          size: 16.h,
        ),
      ),
    );
  }
}
