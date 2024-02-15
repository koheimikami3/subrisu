import '../../../../../constant/exceptions.dart' as exceptions;
import '../../../../../constant/texts.dart' as texts;
import '../../../../../importer.dart';

/// サブスクリプションを作成するボタン
class CreateButton extends ConsumerWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(subscriptionFormNotifierProvider);

    return MyCupertinoButton(
      text: texts.createSubscriptionButton,
      onPressed: formState.serviceName == '' || formState.price == ''
          ? null
          : () => _onPressed(context, ref),
    );
  }

  /// サブスクリプションを作成して一覧画面に戻る
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    String? errorMessage;

    // 各入力フォームのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを作成
      await ref.read(createSubscriptionProvider.future);
    } on Exception {
      errorMessage = exceptions.messageMap[exceptions.createSubscription];
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // 例外が発生した場合、エラーダイアログを表示
    if (errorMessage != null) {
      MyAlertDialog.showError(context, errorMessage);
      return;
    }

    // 一覧画面に戻る
    Navigator.pop(context);
  }
}
