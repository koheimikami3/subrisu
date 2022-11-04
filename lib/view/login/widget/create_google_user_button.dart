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

    final credential = await GoogleManager.singnIn();
    if (credential == null) return;

    // プログレスダイアログを表示
    ProgressDialog.show(context);

    // Firebaseへのサインインを行い、UserCredentialを取得
    final userCredential = await auth.signInWithCredential(credential);

    // UserCredentialからユーザーIDを取得
    final userId = userCredential.user!.uid;

    // ユーザーを作成
    // ユーザーIDをドキュメントIDにする
    await repository.create(userId);

    // アカウント名をプロバイダに保存
    ref.watch(accountProvider.notifier).state = 'Google';

    // プログレスダイアログを閉じる
    Navigator.pop(context);

    // ボトムナビゲーションバーを経由してリスト画面に遷移
    Navigator.pushNamed(context, '/bottomNav');
  }
}
