import '../../../constant/colors.dart' as colors;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

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
    final isDarkMode = ref.watch(darkModeNotifierProvider);

    return Column(
      children: [
        const ItemsTitle(title: texts.serviceInfoTitle),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isDarkMode ? colors.darkItemColor : Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              const IconSelectButton(),
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
