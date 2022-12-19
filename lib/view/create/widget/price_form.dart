import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 料金フォームを表示する
class PriceForm extends ConsumerWidget {
  const PriceForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // '¥'をつけて表示するためのコントローラー
    final controller = TextEditingController(text: '');

    return MyTextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      hintText: texts.priceHint,
      onChanged: (value) {
        ref.watch(priceProvider.notifier).state = value;

        // 表示用に'¥'を加える
        controller.text = '¥$value';

        // カーソルの位置を右端に移動
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      },
    );
  }
}
