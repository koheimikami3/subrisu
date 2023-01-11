import 'package:flutter/cupertino.dart';

import '../../../constant/colors.dart' as colors;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 匿名ユーザーで始めるボタン
class CreateAnonymousUserButton extends ConsumerWidget {
  const CreateAnonymousUserButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      onPressed: () => _onTap(context, ref),
      padding: EdgeInsets.zero,
      child: _text(),
    );
  }

  /// ボタンテキストを表示する
  Text _text() {
    return Text(
      texts.createAnonymousUserButton,
      style: TextStyle(
        fontSize: 15.sp,
        color: colors.appColor,
      ),
    );
  }

  /// 匿名ユーザーを作成し、ボトムナビゲーションバーを経由してリスト画面に遷移する
  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    final repository = ref.watch(userViewModelProvider.notifier);
    var err = '';

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    try {
      // 匿名サインインを実施し、結果から匿名ユーザーIDを取得
      final userId = await anonymousSingnIn();

      // ユーザーを作成
      // 匿名ユーザーIDをドキュメントIDとする
      await repository.create(userId);

      // プロバイダ名をプロバイダに保存
      ref.watch(accountProvider.notifier).state = 'Anonymous';
    } on Exception catch (e) {
      err = selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // エラー内容を表示
    if (err != '') {
      IOSAlertDialog.show(context, true, err);
      return;
    }

    // ボトムナビゲーションバーを経由してリスト画面に遷移
    await Navigator.pushNamed(context, '/bottomNav');
  }
}
