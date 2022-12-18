import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// メモフォームを表示する
class MemoForm extends ConsumerWidget {
  const MemoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDark = ref.watch(darkModeProvider);

    return Column(
      children: [
        const ItemsTitle(title: 'メモ'),
        TextField(
          cursorColor: configs.appColor,
          maxLines: 4,
          decoration: const InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onChanged: (value) {
            ref.watch(memoProvider.notifier).state = value;
          },
        ),
      ],
    );
  }
}
