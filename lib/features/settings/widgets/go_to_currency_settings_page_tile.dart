import '../../../importer.dart';

/// 通貨設定画面に遷移するタイル
class GoToCurrencySettingsPageTile extends StatelessWidget {
  const GoToCurrencySettingsPageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      position: TilePosition.bottom,
      name: AppLocalizations.of(context)!.currencyItem,
      leadingIcon: Icons.currency_yen_outlined,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const CurrencySettingsPage()),
        );
      },
    );
  }
}
