import '../../../../../constant/texts.dart' as texts;
import '../../../../../importer.dart';

/// サブスクリプションを作成するボタン
class CreateSubscriptionButton extends ConsumerWidget {
  const CreateSubscriptionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(subscriptionFormNotifierProvider);

    return MyFilledButton(
      text: texts.createSubscriptionButton,
      onPressed: formState.serviceName.isEmpty || formState.price.isEmpty
          ? null
          : () => _onPressed(context, ref),
    );
  }

  /// サブスクリプションを作成してサブスクリプション一覧画面に戻る
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    String? errorMessage; // エラーメッセージ

    // 入力フォームのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    showProgressDialog(context);

    try {
      // サブスクリプションを作成
      await ref.read(createSubscriptionProvider.future);
    } on Exception {
      // エラーメッセージを取得
      errorMessage = texts.createSubscriptionError;
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // 例外が発生した場合、エラーダイアログを表示
    if (errorMessage != null) {
      MyAlertDialog.showError(context, errorMessage);
      return;
    }

    // サブスクリプション一覧画面に戻る
    Navigator.pop(context);
  }
}
