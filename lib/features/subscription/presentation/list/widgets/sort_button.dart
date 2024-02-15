import 'package:flutter/cupertino.dart';

import '../../../../../constant/configs.dart' as configs;
import '../../../../../importer.dart';

/// 並び替えボタン
class SortButton extends ConsumerWidget {
  const SortButton({super.key});

  static final _prefs = GetIt.I<SharedPreferences>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(subscriptionSortNotifierProvider);

    return Row(
      children: [
        PullDownButton(
          itemBuilder: (context) {
            return [
              const PullDownMenuTitle(title: Text('並び替え')),
              PullDownMenuItem.selectable(
                title: SubscriptionSort.ascendingNextPaymentDays.name,
                selected: sort == SubscriptionSort.ascendingNextPaymentDays,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(
                    configs.listSortKey,
                    SubscriptionSort.ascendingNextPaymentDays.index,
                  );
                  ref
                      .read(subscriptionSortNotifierProvider.notifier)
                      .setSetting(SubscriptionSort.ascendingNextPaymentDays);
                },
              ),
              PullDownMenuItem.selectable(
                title: SubscriptionSort.ascendingPrice.name,
                selected: sort == SubscriptionSort.ascendingPrice,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(
                    configs.listSortKey,
                    SubscriptionSort.ascendingPrice.index,
                  );
                  ref
                      .read(subscriptionSortNotifierProvider.notifier)
                      .setSetting(SubscriptionSort.ascendingPrice);
                },
              ),
              PullDownMenuItem.selectable(
                title: SubscriptionSort.descendingPrice.name,
                selected: sort == SubscriptionSort.descendingPrice,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(
                    configs.listSortKey,
                    SubscriptionSort.descendingPrice.index,
                  );
                  ref
                      .read(subscriptionSortNotifierProvider.notifier)
                      .setSetting(SubscriptionSort.descendingPrice);
                },
              ),
              PullDownMenuItem.selectable(
                title: SubscriptionSort.ascendingServiceName.name,
                selected: sort == SubscriptionSort.ascendingServiceName,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(
                    configs.listSortKey,
                    SubscriptionSort.ascendingServiceName.index,
                  );
                  ref
                      .read(subscriptionSortNotifierProvider.notifier)
                      .setSetting(SubscriptionSort.ascendingServiceName);
                },
              ),
              PullDownMenuItem.selectable(
                title: SubscriptionSort.descendingServiceName.name,
                selected: sort == SubscriptionSort.descendingServiceName,
                itemTheme: const PullDownMenuItemTheme(
                  checkmark: Icons.check,
                ),
                onTap: () {
                  _prefs.setInt(
                    configs.listSortKey,
                    SubscriptionSort.descendingServiceName.index,
                  );
                  ref
                      .read(subscriptionSortNotifierProvider.notifier)
                      .setSetting(SubscriptionSort.descendingServiceName);
                },
              ),
            ];
          },
          buttonBuilder: (context, showMenu) {
            return GestureDetector(
              onTap: () => showMenu(),
              child: Icon(
                CupertinoIcons.arrow_up_arrow_down_circle_fill,
                size: 25.h,
              ),
            );
          },
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
