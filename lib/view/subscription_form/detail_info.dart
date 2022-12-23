import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 詳細情報を表示する
class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ItemsTitle(title: texts.detailInfoTitle),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  children: const [
                    PaymentCycleForm(),
                    ItemDivider(),
                    FirstPaymentDateForm(),
                    ItemDivider(),
                    NotificationForm(),
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
