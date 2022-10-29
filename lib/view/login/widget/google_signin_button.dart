import '../../../constant/paths.dart' as paths;
import '../../../constant/texts.dart' as texts;
import '../../../importer.dart';

/// Googleでサインインするボタン
class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInButton(
      iconImagePath: paths.googleIconPath,
      text: texts.googleSignInButton,
      textColor: Colors.black54,
      backgroundColor: Colors.white,
      border: Border.all(width: 1, color: Colors.black26),
      onPressed: () async => await _onPressed(context, ref),
    );
  }

  // Googleでサインインし、ボトムナビゲーションバーを経由してリスト画面に遷移する
  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    final auth = FirebaseAuth.instance;
    final repository = ref.watch(userViewModelProvider.notifier);

    // Googleサインインをリクエストする
    final googleUser = await GoogleSignIn(scopes: ['email']).signIn();

    // 「キャンセル」が押された場合、nullが返ってくるので処理を終了する
    if (googleUser == null) return;

    // リクエスト結果から認証情報を取得
    final googleAuth = await googleUser.authentication;

    // 認証情報からOAuthCredentialを作成
    final oAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Firebaseへのサインインを行い、UserCredentialを取得
    final userCredential = await auth.signInWithCredential(oAuthCredential);

    // UserCredentialからユーザーIDを取得
    final userId = userCredential.user!.uid;

    // ユーザーを作成
    // ユーザーIDをドキュメントIDにする
    await repository.create(userId);

    // ボトムナビゲーションバーを経由してリスト画面に遷移
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/bottomNav');
  }
}
