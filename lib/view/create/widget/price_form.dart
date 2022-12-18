import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// 料金フォームを表示する
class PriceForm extends ConsumerStatefulWidget {
  const PriceForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PriceForm> createState() => _PriceFormState();
}

class _PriceFormState extends ConsumerState<PriceForm> {
  // '¥'をつけて表示するためのコントローラー
  final controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
