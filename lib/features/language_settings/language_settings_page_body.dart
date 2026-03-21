import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/enums/language_settings.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/features/language_settings/widgets/select_language_tile.dart';

/// 言語設定画面のScaffoldBody
class LanguageSettingsPageBody extends StatelessWidget {
  const LanguageSettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        for (int i = 0; i < LanguageSettings.values.length; i++)
          Column(
            children: [
              SelectLanguageTile(
                position: i == LanguageSettings.values.length - 1
                    ? TilePosition.bottom
                    : i == 0
                        ? TilePosition.top
                        : TilePosition.middle,
                languageSettings: LanguageSettings.values[i],
              ),
              if (i < LanguageSettings.values.length - 1) const ItemDivider(),
            ],
          ),
      ],
    );
  }
}
