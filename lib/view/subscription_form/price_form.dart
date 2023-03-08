import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// 料金フォームを表示する
class PriceForm extends ConsumerWidget {
  const PriceForm({
    super.key,
    this.price,
  });

  final String? price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyTextFormField(
      initialValue: price,
      maxLength: 7,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      hintText: texts.priceHint,
      onChanged: (value) {
        ref.watch(priceProvider.notifier).state = value;
      },
    );
  }
}
