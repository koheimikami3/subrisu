import '../../importer.dart';

/// 通貨設定画面のScaffoldBody
class CurrencySettingsPageBody extends StatelessWidget {
  const CurrencySettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        for (int i = 0; i < CurrencySettings.values.length; i++)
          Column(
            children: [
              SelectCurrencyTile(
                position: i == CurrencySettings.values.length - 1
                    ? TilePosition.bottom
                    : i == 0
                        ? TilePosition.top
                        : TilePosition.middle,
                currencySettings: CurrencySettings.values[i],
              ),
              if (i < CurrencySettings.values.length - 1) const ItemDivider(),
            ],
          ),
      ],
    );
  }
}
