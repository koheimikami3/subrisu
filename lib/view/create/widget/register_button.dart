import 'package:flutter/cupertino.dart';

import '../../../constant/configs.dart' as configs;
import '../../../importer.dart';

/// 新規登録を行うボタン
class RegisterButton extends ConsumerWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: CupertinoButton(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        padding: EdgeInsets.zero,
        color: configs.appColor,
        onPressed: () async => await _onPressed(context, ref),
        child: _text(),
      ),
    );
  }

  /// ボタンのテキストを表示する
  Text _text() {
    return const Text(
      '登録',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final repository = ref.watch(subscriptionViewModelProvider.notifier);
    String err = '';

    // TextFieldのフォーカスを解除
    FocusScope.of(context).unfocus();

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // サブスクリプションを登録
      await repository.create();
    } catch (e) {
      err = ErrorHandler.selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // エラーが発生した場合、ダイアログを表示
    if (err != '') {
      IOSAlertDialog.show(context, true, err);
      return;
    }

    // リスト画面に戻る
    Navigator.pop(context);
  }
}
