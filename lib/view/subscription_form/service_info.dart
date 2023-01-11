import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// サービス情報を表示する
class ServiceInfo extends StatelessWidget {
  const ServiceInfo({
    super.key,
    this.serviceName,
    this.price,
  });

  final String? serviceName;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: texts.serviceInfoTitle),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
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
