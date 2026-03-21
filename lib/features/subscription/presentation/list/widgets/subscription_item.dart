import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/constants/app_colors.dart';
import 'package:subrisu/features/subscription/domain/subscription/subscription.dart';
import 'package:subrisu/features/subscription/presentation/edit/edit_subscription_page.dart';
import 'package:subrisu/features/subscription/presentation/list/widgets/next_payment_date.dart';
import 'package:subrisu/gen/assets.gen.dart';
import 'package:subrisu/providers/currency_settings_provider.dart';
import 'package:subrisu/providers/theme_settings_provider.dart';
import 'package:subrisu/utils/color_selector.dart';

/// サブスクリプションリストのアイテム
class SubscriptionItem extends ConsumerWidget {
  const SubscriptionItem({
    super.key,
    required this.subscription,
  });

  final Subscription subscription; // サブスクリプション

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Row(
      children: [
        SizedBox(width: 20.w),
        Expanded(
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.white,
              darkColor: const Color.fromRGBO(48, 48, 48, 1),
            ),
            child: InkWell(
              onTap: () => _onTap(context),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 57.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 15.w),
                          _iconImage(),
                          SizedBox(width: 15.w),
                          Expanded(child: _serviceName()),
                          SizedBox(width: 5.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _price(context, ref),
                              NextPaymentDate(
                                paymentCycle: subscription.paymentCycle,
                                firstPaidDate:
                                    subscription.firstPaidOn.toDate(),
                              ),
                            ],
                          ),
                          SizedBox(width: 15.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }

  /// サブスクリプション編集画面に遷移する
  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => EditSubscriptionPage(subscription: subscription),
        fullscreenDialog: true,
      ),
    );
  }

  /// アイコン画像を表示する
  Widget _iconImage() {
    late String imagePath;
    imagePath = subscription.iconImagePath;

    if (imagePath.isEmpty) {
      imagePath = Assets.images.subscription.subrisu.path;
    }

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
      child: Image.asset(
        imagePath,
        height: 33.h,
        width: 33.h,
      ),
    );
  }

  /// サービス名
  Widget _serviceName() {
    return Text(
      subscription.serviceName,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 17.sp),
    );
  }

  /// 料金
  Widget _price(BuildContext context, WidgetRef ref) {
    final currencySettings = ref.watch(currencySettingsNotifierProvider);

    return Text(
      currencySettings.formatAmount(subscription.price.toDouble()),
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
