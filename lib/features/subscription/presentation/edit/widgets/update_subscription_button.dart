import '../../../../../importer.dart';

/// サブスクリプションを更新するボタン
class UpdateSubscriptionButton extends ConsumerWidget {
  const UpdateSubscriptionButton({
    super.key,
    required this.subscriptionId,
  });

  final String subscriptionId; // サブスクリプションID

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(subscriptionFormNotifierProvider);

    return MyFilledButton(
      text: AppLocalizations.of(context)!.updateSubscriptionButton,
      onPressed: formState.serviceName.isEmpty || formState.price.isEmpty
          ? null
          : () => _onPressed(context, ref),
    );
  }

  /// サブスクリプションを更新してサブスクリプション一覧画面に戻る
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    String? errorMessage; // エラーメッセージ

    // 入力フォームのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    showProgressDialog(context);

    try {
      // サブスクリプションを更新
      await ref.read(updateSubscriptionProvider(subscriptionId).future);
    } on Exception {
      // エラーメッセージを取得
      errorMessage = AppLocalizations.of(context)!.updateSubscritpionError;
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // 例外が発生した場合、エラーダイアログを表示
    if (errorMessage != null) {
      showErrorDialog(context, errorMessage);
      return;
    }

    // サブスクリプション一覧画面に戻る
    Navigator.pop(context);
  }
}
