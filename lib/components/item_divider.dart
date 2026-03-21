import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/providers/theme_settings_provider.dart';
import 'package:subrisu/utils/color_selector.dart';

/// 項目の境界線
class ItemDivider extends ConsumerWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Container(
      height: 0.7.h,
      color: selectColor(
        context: context,
        themeSettings: themeSettings,
        lightColor: Colors.grey.shade400,
        darkColor: Colors.grey.shade600,
      ),
    );
  }
}
