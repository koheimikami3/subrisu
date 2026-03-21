import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/components/items_title.dart';
import 'package:subrisu/constants/app_colors.dart';
import 'package:subrisu/enums/payment_cycle.dart';
import 'package:subrisu/features/subscription/presentation/widgets/first_paid_on_form.dart';
import 'package:subrisu/features/subscription/presentation/widgets/payment_cycle_selection_form.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/theme_settings_provider.dart';
import 'package:subrisu/utils/color_selector.dart';

/// サブスクリプションの詳細情報
class DetailInfo extends ConsumerWidget {
  const DetailInfo({
    super.key,
    this.paymentCycle,
  });

  final PaymentCycle? paymentCycle; // 支払い周期

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.detailInfoTitle),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey.shade400),
            color: selectColor(
              context: context,
              themeSettings: themeSettings,
              lightColor: Colors.white,
              darkColor: AppColors.darkItem,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  children: [
                    PaymentCycleSelectionForm(paymentCycle: paymentCycle),
                    const ItemDivider(),
                    const FirstPaidOnForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
