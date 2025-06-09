import '../../../../importer.dart';

/// 料金を入力するフォーム
class PriceInputForm extends ConsumerWidget {
  const PriceInputForm({
    super.key,
    this.price,
  });

  final String? price; // 料金

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyTextFormField(
      initialValue: price,
      maxLength: 7,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      hintText: AppLocalizations.of(context)!.priceHint,
      onChanged: (value) {
        // 料金の状態を更新
        ref.read(subscriptionFormNotifierProvider.notifier).setPrice(value);
      },
    );
  }
}
