import 'package:flutter/cupertino.dart';

import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 編集画面のUIを作成する
class EditPage extends ConsumerWidget {
  const EditPage({
    Key? key,
    required this.subscriptionDoc,
  }) : super(key: key);

  final DocumentSnapshot subscriptionDoc; // サブスクリプションドキュメント

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(texts.editPage),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  splashRadius: 25.w,
                  color: Colors.red,
                  onPressed: () => {
                    showCupertinoDialog(
                      context: context,
                      builder: (_) => DeleteSubscriptionDialog(
                        subscriptionDoc: subscriptionDoc,
                      ),
                    ),
                  },
                ),
                SizedBox(width: 5.w),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(width: 20.w),
              // Expanded(
              //   child: Column(
              //     children: [
              //       SizedBox(height: 20.h),
              //       const ServiceInfo(),
              //       SizedBox(height: 25.h),
              //       const DetailInfo(),
              //       SizedBox(height: 25.h),
              //       const MemoForm(),
              //       SizedBox(height: 30.h),
              //       const RegisterButton(),
              //     ],
              //   ),
              // ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
