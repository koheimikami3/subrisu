import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// 料金フォームを表示する
class PriceForm extends ConsumerWidget {
  const PriceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      cursorColor: configs.appColor,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '料金',
        hintStyle: TextStyle(fontSize: 14.sp),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      onChanged: (value) {
        ref.watch(priceProvider.notifier).state = value;
      },
    );
  }
}
