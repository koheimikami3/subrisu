import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/components/notice_text.dart';
import 'package:subrisu/features/purchase/widgets/purchase_tile.dart';
import 'package:subrisu/features/purchase/widgets/restore_tile.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 課金画面のScaffoldBody
class PurchasePageBody extends ConsumerWidget {
  const PurchasePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        const PurchaseTile(),
        const ItemDivider(),
        const RestoreTile(),
        SizedBox(height: 10.h),
        Row(
          children: [
            SizedBox(width: 15.w),
            NoticeText(text: AppLocalizations.of(context)!.purchaseNotice),
          ],
        ),
      ],
    );
  }
}
