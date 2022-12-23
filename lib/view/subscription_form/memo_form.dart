import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// メモフォームを表示する
class MemoForm extends ConsumerWidget {
  const MemoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ItemsTitle(title: texts.memoTitle),
        MyTextFormField(
          minLines: 4,
          maxLines: null,
          onChanged: (value) {
            ref.watch(memoProvider.notifier).state = value;
          },
        ),
      ],
    );
  }
}
