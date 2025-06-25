import '../../../importer.dart';

/// 通貨を変更するタイル
class SelectCurrencyTile extends ConsumerWidget {
  const SelectCurrencyTile({
    super.key,
    required this.position,
    required this.currencySettings,
  });

  final TilePosition position;
  final CurrencySettings currencySettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrencySettings =
        ref.watch(currencySettingsNotifierProvider);

    return MyListTile(
      position: position,
      name: AppLocalizations.of(context)!.currency(currencySettings.code),
      trailing:
          CheckedIcon(isChecked: selectedCurrencySettings == currencySettings),
      onTap: () {
        ref
            .read(currencySettingsNotifierProvider.notifier)
            .set(currencySettings);
      },
    );
  }
}
