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
        ItemsTitle(title: AppLocalizations.of(context)!.memoFormTitle),
        // ignore: use_decorated_box
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: MyTextFormField(
            initialValue: memo,
            minLines: 3,
            maxLines: null,
            onChanged: (value) {
              // メモの状態を更新
              ref
                  .read(subscriptionFormNotifierProvider.notifier)
                  .setMemo(value);
            },
          ),
        ),
      ],
    );
  }
}
