import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/constants/app_colors.dart';
import 'package:subrisu/gen/assets.gen.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// サブスクリプションが1つも登録されていないことを示すテキストとサブリス画像
class NoSubscription extends StatelessWidget {
  const NoSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image(),
        _text(context),
      ],
    );
  }

  /// サブリス画像
  ///
  /// アプリカラーにして表示する
  ColorFiltered _image() {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        AppColors.primary,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        Assets.images.subscription.subrisu.path,
        height: 80.h,
        width: 80.h,
      ),
    );
  }

  /// テキスト
  Widget _text(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.noSubscription,
      textAlign: TextAlign.center,
    );
  }
}
