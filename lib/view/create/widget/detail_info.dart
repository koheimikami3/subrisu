import '../../../importer.dart';

/// 詳細情報を表示する
class DetailInfo extends ConsumerWidget {
  const DetailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDark = ref.watch(darkModeProvider);

    return Column(
      children: [
        const ItemsTitle(title: '詳細情報'),
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
                    StartDateForm(),
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
