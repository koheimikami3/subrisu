import '../importer.dart';

class GoogleManager {
  static Future<OAuthCredential?> singnIn() async {
    // Googleサインインをリクエストする
    final googleUser = await GoogleSignIn(scopes: ['email']).signIn();

    // 「キャンセル」が押された場合、nullが返ってくるので処理を終了する
    if (googleUser == null) return null;

    // リクエスト結果から認証情報を取得
    final googleAuth = await googleUser.authentication;

    // 認証情報からOAuthCredentialを作成
    final oAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return oAuthCredential;
  }
}
