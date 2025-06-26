import '../../../../../importer.dart';

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
