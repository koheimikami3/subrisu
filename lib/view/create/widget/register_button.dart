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
    final repository = ref.watch(subscriptionViewModelProvider.notifier);
    var err = '';

    // TextFieldのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを登録
      await repository.create();
    } on Exception catch (e) {
      err = selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // エラーが発生した場合、ダイアログを表示
    if (err != '') {
      MyAlertDialog.showError(context, err);
      return;
    }

    // リスト画面に戻る
    Navigator.pop(context);
  }
}
