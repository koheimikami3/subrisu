import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 料金フォームを表示する
class PriceForm extends ConsumerWidget {
  const PriceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10.w),
            const Text(
              '料金',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '*',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.grey.shade200,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            ref.watch(priceProvider.notifier).state = value;
          },
        ),
      ],
    );
  }
}
