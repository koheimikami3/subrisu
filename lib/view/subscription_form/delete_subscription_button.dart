import 'package:flutter/cupertino.dart';

import '../../importer.dart';

/// ユーザー削除ダイアログを呼び出すボタン
class DeleteSubscriptionButton extends StatelessWidget {
  const DeleteSubscriptionButton({
    Key? key,
    required this.subscriptionDoc,
  }) : super(key: key);

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (_) => DeleteSubscriptionDialog(
            subscriptionDoc: subscriptionDoc,
          ),
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
