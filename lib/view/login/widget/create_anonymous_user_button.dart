import 'package:flutter/cupertino.dart';

import '../../../constant/configs.dart' as configs;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// 匿名ユーザーで始めるボタン
class CreateAnonymousUserButton extends ConsumerWidget {
  const CreateAnonymousUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      onPressed: () async => await _onTap(context, ref),
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
        color: configs.appColor,
      ),
    );
  }

  /// 匿名ユーザーを作成し、ボトムナビゲーションバーを経由してリスト画面に遷移する
  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(userViewModelProvider.notifier);

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    // 匿名認証を実施
    final credential = await auth.signInAnonymously();

    // 匿名認証の結果から現在のユーザーIDを取得
    final anonAuthId = credential.user!.uid;

    // ユーザーを作成
    // 匿名認証IDをユーザーIDとする
    await repository.create(anonAuthId);

    // アカウント名をプロバイダに保存
    ref.watch(accountProvider.notifier).state = 'Anonymous';

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // ボトムナビゲーションバーを経由してリスト画面に遷移
    Navigator.pushNamed(context, '/bottomNav');
  }
}
