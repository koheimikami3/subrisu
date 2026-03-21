import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subrisu/components/item_divider.dart';
import 'package:subrisu/components/items_title.dart';
import 'package:subrisu/constants/app_colors.dart';
import 'package:subrisu/features/subscription/presentation/widgets/price_input_form.dart';
import 'package:subrisu/features/subscription/presentation/widgets/select_subscription_icon_button.dart';
import 'package:subrisu/features/subscription/presentation/widgets/service_name_input_form.dart';
import 'package:subrisu/l10n/app_localizations.dart';
import 'package:subrisu/providers/theme_settings_provider.dart';
import 'package:subrisu/utils/color_selector.dart';

/// サービス情報を表示する
class ServiceInfo extends ConsumerWidget {
  const ServiceInfo({
    super.key,
    this.serviceName,
    this.price,
  });

  final String? serviceName;
  final String? price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);

    return Column(
      children: [
        ItemsTitle(title: AppLocalizations.of(context)!.serviceInfoTitle),
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
              const SelectSubscriptionIconButton(),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  children: [
                    ServiceNameInputForm(serviceName: serviceName),
                    const ItemDivider(),
                    PriceInputForm(price: price),
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
