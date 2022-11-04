import '../../../../constant/texts.dart' as texts;
import '../../../../importer.dart';

/// 匿名ユーザーからGoogleユーザーに移行するボタン
class LinkGoogleUserButton extends ConsumerWidget {
  const LinkGoogleUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GoogleSignInButton(
      text: texts.linkGoogleUserButton,
      onPressed: () async => await _onPressed(context, ref),
    );
  }

  /// Googleでサインインし、ボトムナビゲーションバーを経由してリスト画面に遷移する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;

    final credential = await GoogleManager.singnIn();
    if (credential == null) return;

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    await auth.currentUser!.linkWithCredential(credential);

    // アカウント名をプロバイダに保存
    ref.watch(accountProvider.notifier).state = 'Google';

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // ボトムナビゲーションバーを経由してリスト画面に遷移
    // 今までの画面を全てウィジェットツリーから削除
    Navigator.pushNamedAndRemoveUntil(context, '/bottomNav', (_) => false);

    IOSAlertDialog.show(context, false, 'アカウント連携が完了しました。');
  }
}
