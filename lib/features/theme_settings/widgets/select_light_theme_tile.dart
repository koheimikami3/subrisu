import '../../../importer.dart';

/// テーマをライトに変更するタイル
class SelectLightThemeTile extends ConsumerWidget {
  const SelectLightThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return MyListTile(
      position: ItemPosition.middle,
      name: AppLocalizations.of(context)!.theme(ThemeSettings.light.name),
      leadingIcon: Icons.light_mode_outlined,
      trailing: CheckedIcon(isChecked: themeSettings == ThemeSettings.light),
      onTap: () {
        ref.read(themeSettingsNotifierProvider.notifier).setLight();
      },
    );
  }
}
