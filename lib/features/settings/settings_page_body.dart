import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/features/settings/widgets/app_item_list.dart';
import 'package:subrisu/features/settings/widgets/author_app_item_list.dart';
import 'package:subrisu/features/settings/widgets/go_to_purchase_page_tile.dart';
import 'package:subrisu/features/settings/widgets/support_item_list.dart';

/// 設定画面のScaffoldBody
class SettingsPageBody extends StatelessWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                const GoToPurchasePageTile(),
                SizedBox(height: 25.h),
                const AppItemList(),
                SizedBox(height: 25.h),
                const SupportItemList(),
                SizedBox(height: 25.h),
                const AuthorAppItemList(),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
