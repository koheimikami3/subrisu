import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/constants/app_colors.dart';
import 'package:subrisu/enums/author_app.dart';
import 'package:subrisu/enums/tile_position.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/theme_settings_provider.dart';
import 'package:subrisu/utils/color_selector.dart';
import 'package:url_launcher/url_launcher.dart';

/// 作者の他のアプリを App Store で開くタイル
///
/// 背景色・枠線は MyListTile に揃えている。MyListTile は前方に IconData しか
/// 置けないため、共通部品を広げずに別ウィジェットにした。
class AuthorAppTile extends ConsumerWidget {
  const AuthorAppTile({
    super.key,
    required this.app,
    required this.position,
  });

  final AuthorApp app; // 表示するアプリ
  final TilePosition position; // タイルの配置位置

  /// App Store を開く
  ///
  /// `LaunchMode.externalApplication` を明示する。既定の `platformDefault` は
  /// iOS ではアプリ内 Safari になり、App Store アプリに渡らないため。
  Future<void> _open() => launchUrl(
        Uri.parse(app.appStoreUrl),
        mode: LaunchMode.externalApplication,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);
    final l10n = AppLocalizations.of(context)!;
    final subTextColor = selectColor(
      context: context,
      themeSettings: themeSettings,
      lightColor: Colors.grey.shade600,
      darkColor: Colors.grey.shade400,
    );

    return Material(
      color: selectColor(
        context: context,
        themeSettings: themeSettings,
        lightColor: Colors.white,
        darkColor: AppColors.darkItem,
      ),
      shape: position == TilePosition.independence
          ? Border(
              top: BorderSide(color: Colors.grey.shade400),
              bottom: BorderSide(color: Colors.grey.shade400),
            )
          : position == TilePosition.top
              ? Border(top: BorderSide(color: Colors.grey.shade400))
              : position == TilePosition.bottom
                  ? Border(bottom: BorderSide(color: Colors.grey.shade400))
                  : null,
      child: InkWell(
        onTap: _open,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Row(
            children: [
              Container(
                // 明るいアイコンが白地に溶けないよう、角丸の内側に薄い縁を重ねる
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: app.icon.image(width: 44.w, height: 44.w),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(app.name(l10n)),
                    SizedBox(height: 2.h),
                    Text(
                      app.tagline(l10n),
                      style: TextStyle(fontSize: 12.sp, color: subTextColor),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              // App Store の「入手」ボタンに似せたラベル(タップ領域は行全体)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  l10n.authorAppGetButton,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
