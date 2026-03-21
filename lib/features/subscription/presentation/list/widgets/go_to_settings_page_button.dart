import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/features/settings/settings_page.dart';

/// 設定画面に遷移するボタン
class GoToSettingsPageButton extends StatelessWidget {
  const GoToSettingsPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const SettingsPage(),
            fullscreenDialog: true,
          ),
        );
      },
      icon: Icon(
        Icons.settings,
        size: 23.h,
      ),
    );
  }
}
