import '../../../importer.dart';

/// テーマを端末設定に変更するタイル
class SelectDeviceThemeTile extends ConsumerWidget {
  const SelectDeviceThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return MyListTile(
      position: TilePosition.top,
      name: AppLocalizations.of(context)!.theme(ThemeSettings.device.name),
      leadingIcon: Icons.phone_iphone_outlined,
      trailing: CheckedIcon(isChecked: themeSettings == ThemeSettings.device),
      onTap: () {
        ref.read(themeSettingsNotifierProvider.notifier).setDevice();
      },
    );
  }
}
