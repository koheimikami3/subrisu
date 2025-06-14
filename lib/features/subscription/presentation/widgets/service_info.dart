import '../../../../constants/colors.dart' as colors;
import '../../../../importer.dart';

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
    final themeSetting = ref.watch(themeSettingsNotifierProvider);

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
              themeSetting: themeSetting,
              lightColor: Colors.white,
              darkColor: colors.darkItemColor,
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
