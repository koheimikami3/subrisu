import '../../constant/texts.dart' as texts;
import '../../importer.dart';

/// メモフォームを表示する
class MemoForm extends ConsumerWidget {
  const MemoForm({
    super.key,
    this.memo,
  });

  final String? memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ItemsTitle(title: texts.memoTitle),
        MyTextFormField(
          initialValue: memo,
          minLines: 3,
          maxLines: null,
          onChanged: (value) {
            ref.watch(memoProvider.notifier).state = value;
          },
        ),
      ],
    );
  }
}
