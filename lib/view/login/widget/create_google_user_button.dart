import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// GoogleでFirebaseのユーザーを作成するボタン
class CreateGoogleUserButton extends ConsumerWidget {
  const CreateGoogleUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GoogleSignInButton(
      text: texts.createGoogleUserButton,
      onPressed: () async => await _onPressed(context, ref),
    );
  }

  /// Googleでサインインし、ボトムナビゲーションバーを経由してリスト画面に遷移する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(userViewModelProvider.notifier);
    String err = '';

    try {
      final credential = await UserManager.googleSingnIn();
      if (credential == null) return;

      // プログレスダイアログを表示
      ProgressDialog.show(context);

      // Firebaseへのサインインを行い、UserCredentialを取得
      final userCredential = await auth.signInWithCredential(credential);

      // UserCredentialからユーザーIDを取得
      final userId = userCredential.user!.uid;

      // ユーザードキュメントが既に存在するか判定
      // 存在する場合はそのまま使用する
      final userDoc = await repository.getUser(userId);

      // 存在しない場合、新たに作成
      // ユーザーIDをドキュメントIDにする
      if (userDoc == null) await repository.create(userId);

      // アカウント名をプロバイダに保存
      ref.watch(accountProvider.notifier).state = 'Google';
    } catch (e) {
      err = ErrorHandler.selectMessage(e.toString());
    }

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    if (err != '') {
      IOSAlertDialog.show(context, true, err);
      return;
    }

    // ボトムナビゲーションバーを経由してリスト画面に遷移
    Navigator.pushNamed(context, '/bottomNav');
  }
}
