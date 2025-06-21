import '../../../importer.dart';

/// テーマをダークに変更するタイル
class SelectDarkThemeTile extends ConsumerWidget {
  const SelectDarkThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return MyListTile(
      position: ItemPosition.bottom,
      name: AppLocalizations.of(context)!.theme(ThemeSettings.dark.name),
      leadingIcon: Icons.dark_mode_outlined,
      trailing: CheckedIcon(isChecked: themeSettings == ThemeSettings.dark),
      onTap: () {
        ref.read(themeSettingsNotifierProvider.notifier).setDark();
      },
    );
  }
}
