import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/subrisu_image.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// ログインエラー画面のScaffoldBody
class LoginErrorPageBody extends StatelessWidget {
  const LoginErrorPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SubrisuImage(color: Colors.red),
          _text(context),
        ],
      ),
    );
  }

  /// テキスト
  Widget _text(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.loginError,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15.sp,
        color: Colors.red,
      ),
    );
  }
}
