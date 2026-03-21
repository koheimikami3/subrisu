import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/providers/theme_settings_provider.dart';
import 'package:subrisu/utils/color_selector.dart';

/// 項目リストのタイトル
class ItemsTitle extends ConsumerWidget {
  const ItemsTitle({
    super.key,
    required this.title,
  });

  final String title; // タイトル

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 15.w),
            _title(context, ref),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }

  /// タイトル
  Widget _title(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Text(
      title,
      style: TextStyle(
        fontSize: 12.5.sp,
        color: selectColor(
          context: context,
          themeSettings: themeSettings,
          lightColor: Colors.grey.shade700,
          darkColor: Colors.grey.shade400,
        ),
      ),
    );
  }
}
