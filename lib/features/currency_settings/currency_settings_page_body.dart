import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/enums/currency_settings.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/currency_settings/widgets/select_currency_tile.dart';

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
