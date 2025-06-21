import '../../../../../importer.dart';

/// サブスクリプションを並び替えるボタン
class SortSubscriptionButton extends ConsumerWidget {
  const SortSubscriptionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortSettings = ref.watch(sortSettingsNotifierProvider);

    return PullDownButton(
      itemBuilder: (context) {
        return [
          PullDownMenuTitle(
            title: Text(AppLocalizations.of(context)!.sortPullDownTitle),
          ),
          for (final sortSettings in SortSettings.values)
            PullDownMenuItem.selectable(
              title: AppLocalizations.of(context)!.sort(sortSettings.name),
              selected: selectedSortSettings == sortSettings,
              itemTheme: const PullDownMenuItemTheme(checkmark: Icons.check),
              onTap: () {
                ref
                    .read(sortSettingsNotifierProvider.notifier)
                    .setSortSettings(sortSettings);
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
