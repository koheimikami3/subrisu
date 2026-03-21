import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/enums/theme_settings.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/theme_settings/widgets/select_theme_tile.dart';

/// テーマ設定画面のScaffoldBody
class ThemeSettingsPageBody extends StatelessWidget {
  const ThemeSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        for (int i = 0; i < ThemeSettings.values.length; i++)
          Column(
            children: [
              SelectThemeTile(
                position: i == ThemeSettings.values.length - 1
                    ? TilePosition.bottom
                    : i == 0
                        ? TilePosition.top
                        : TilePosition.middle,
                themeSettings: ThemeSettings.values[i],
              ),
              if (i < ThemeSettings.values.length - 1) const ItemDivider(),
            ],
          ),
      ],
    );
  }
}
