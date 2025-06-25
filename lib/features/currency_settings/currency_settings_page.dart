import '../../importer.dart';

/// 通貨設定画面
class CurrencySettingsPage extends StatelessWidget {
  const CurrencySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.currencySettingsPageTitle),
      ),
      body: const CurrencySettingsPageBody(),
    );
  }
}
