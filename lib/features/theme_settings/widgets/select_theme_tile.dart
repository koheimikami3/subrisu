import '../../../importer.dart';

/// アプリのテーマを変更するタイル
class SelectThemeTile extends ConsumerWidget {
  const SelectThemeTile({
    super.key,
    required this.position,
    required this.themeSettings,
  });

  final TilePosition position;
  final ThemeSettings themeSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedThemeSettings = ref.watch(themeSettingsNotifierProvider);
    late final IconData leadingIcon;

    // テーマに応じたアイコンを設定
    switch (themeSettings) {
      case ThemeSettings.light:
        leadingIcon = Icons.light_mode_outlined;
      case ThemeSettings.dark:
        leadingIcon = Icons.dark_mode_outlined;
      case ThemeSettings.device:
        leadingIcon = Icons.phone_iphone_outlined;
    }

    return MyListTile(
      position: position,
      name: AppLocalizations.of(context)!.theme(themeSettings.name),
      leadingIcon: leadingIcon,
      trailing: CheckedIcon(isChecked: selectedThemeSettings == themeSettings),
      onTap: () {
        ref.read(themeSettingsNotifierProvider.notifier).set(themeSettings);
      },
    );
  }
}
