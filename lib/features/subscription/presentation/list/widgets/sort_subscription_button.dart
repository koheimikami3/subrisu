import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:subrisu/enums/subscription_sort_order.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/subscription_sort_order_provider.dart';

/// サブスクリプションを並び替えるボタン
class SortSubscriptionButton extends ConsumerWidget {
  const SortSubscriptionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortOrder = ref.watch(subscriptionSortOrderNotifierProvider);

    return PullDownButton(
      itemBuilder: (context) {
        return [
          PullDownMenuTitle(
            title: Text(AppLocalizations.of(context)!.sortPullDownTitle),
          ),
          for (final sortOrder in SubscriptionSortOrder.values)
            PullDownMenuItem.selectable(
              title: AppLocalizations.of(context)!.sort(sortOrder.name),
              selected: selectedSortOrder == sortOrder,
              itemTheme: const PullDownMenuItemTheme(checkmark: Icons.check),
              onTap: () {
                ref
                    .read(subscriptionSortOrderNotifierProvider.notifier)
                    .set(sortOrder);
              },
            ),
        ];
      },
      buttonBuilder: (context, showMenu) {
        return IconButton(
          onPressed: () => showMenu(),
          icon: Icon(
            Icons.sort,
            size: 23.h,
          ),
        );
      },
    );
  }
}
