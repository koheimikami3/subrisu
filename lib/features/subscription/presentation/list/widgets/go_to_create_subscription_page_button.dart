import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/enums/purchase_status.dart';
import 'package:subrisu/features/subscription/presentation/create/create_subscription_page.dart';
import 'package:subrisu/providers/purchase_status_provider.dart';

/// サブスクリプション作成画面に遷移するボタン
class GoToCreateSubscriptionPageButton extends ConsumerWidget {
  const GoToCreateSubscriptionPageButton({super.key});

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
