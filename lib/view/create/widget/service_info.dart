import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// サービス情報を表示する
class ServiceInfo extends StatelessWidget {
  const ServiceInfo({Key? key}) : super(key: key);

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
                  children: const [
                    ServiceNameForm(),
                    ItemDivider(),
                    PriceForm(),
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
