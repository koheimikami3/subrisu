import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// メモを入力するフォーム
class MemoInputForm extends ConsumerWidget {
  const MemoInputForm({
    super.key,
    this.memo,
  });

  final String? memo; // メモ

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ItemsTitle(title: texts.memoFormTitle),
        MyTextFormField(
          initialValue: memo,
          minLines: 3,
          maxLines: null,
          onChanged: (value) {
            // メモの状態を更新
            ref.read(subscriptionFormNotifierProvider.notifier).setMemo(value);
          },
        ),
      ],
    );
  }
}
