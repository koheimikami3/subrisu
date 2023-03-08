import '../../../constant/exceptions.dart' as exceptions;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 新規登録を行うボタン
class RegisterButton extends ConsumerWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceName = ref.watch(serviceNameProvider);
    final price = ref.watch(priceProvider);

    return MyCupertinoButton(
      text: texts.createSubscriptionButton,
      onPressed: serviceName == '' || price == ''
          ? null
          : () => _onPressed(context, ref),
    );
  }

  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.read(subscriptionViewModelProvider.notifier);
    var message = '';

    // TextFieldのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを登録
      await repository.create();
    } on Exception {
      message = exceptions.messageMap[exceptions.createSubscription]!;
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // 例外が発生した場合、エラーダイアログを表示
    if (message != '') {
      MyAlertDialog.showError(context, message);
      return;
    }

    // リスト画面に戻る
    Navigator.pop(context);
  }
}
