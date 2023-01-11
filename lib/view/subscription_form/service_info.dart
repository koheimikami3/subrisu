import '../../constant/colors.dart' as colors;
import '../../constant/texts.dart' as texts;
import '../../importer.dart';

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
    final isDark = ref.watch(darkModeProvider);

    return Column(
      children: [
        const ItemsTitle(title: texts.serviceInfoTitle),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isDark ? colors.darkItemColor : Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              const IconSelectButton(),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  children: [
                    ServiceNameForm(serviceName: serviceName),
                    const ItemDivider(),
                    PriceForm(price: price),
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
