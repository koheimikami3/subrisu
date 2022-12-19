import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// メモフォームを表示する
class MemoForm extends ConsumerWidget {
  const MemoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ItemsTitle(title: texts.memoTitle),
        MyTextField(
          maxLines: 3,
          onChanged: (value) {
            ref.watch(memoProvider.notifier).state = value;
          },
        ),
      ],
    );
  }
}
