import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 料金フォームを表示する
class PriceForm extends ConsumerWidget {
  const PriceForm({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyTextFormField(
      initialValue: price,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      hintText: texts.priceHint,
      onChanged: (value) {
        ref.watch(priceProvider.notifier).state = value;
      },
    );
  }
}
