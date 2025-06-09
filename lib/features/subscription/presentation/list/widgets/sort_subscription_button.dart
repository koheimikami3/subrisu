import '../../../../../constants/configs.dart' as configs;
import '../../../../../importer.dart';

/// サブスクリプションを並び替えるボタン
class SortSubscriptionButton extends ConsumerWidget {
  const SortSubscriptionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortSetting = ref.watch(sortSettingNotifierProvider);

    return PullDownButton(
      itemBuilder: (context) {
        return [
          PullDownMenuTitle(
            title: Text(AppLocalizations.of(context)!.sortPullDownTitle),
          ),
          for (final sortSetting in SortSetting.values)
            PullDownMenuItem.selectable(
              title: AppLocalizations.of(context)!.sort(sortSetting.name),
              selected: selectedSortSetting == sortSetting,
              itemTheme: const PullDownMenuItemTheme(checkmark: Icons.check),
              onTap: () {
                ref
                    .read(sharedPreferencesProvider)
                    .setInt(configs.listSortKey, sortSetting.index);
                ref
                    .read(sortSettingNotifierProvider.notifier)
                    .setSetting(sortSetting);
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
