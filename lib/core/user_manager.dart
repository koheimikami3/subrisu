import '../constant/errors.dart' as errors;
import '../importer.dart';

final _auth = FirebaseAuth.instance;

/// ユーザーが使用しているプロバイダを取得し、アプリに反映する
void getUserProvider(WidgetRef ref, User user) {
  // 匿名の場合
  if (user.isAnonymous) {
    ref.read(accountProvider.notifier).state = 'Anonymous';
  }

  // 匿名ではない場合
  if (!user.isAnonymous) {
    // ユーザー内のプロバイダIDを取得
    final userInfoList = user.providerData;
    final providerId = userInfoList.first.providerId;

    // IDがAppleの場合
    if (providerId == '') {
      ref.read(accountProvider.notifier).state = 'Apple';
    }

    // IDがGoogleの場合
    if (providerId == 'google.com') {
      ref.read(accountProvider.notifier).state = 'Google';
    }
  }
}

/// 匿名サインインを行い、結果からuidを取得する
Future<String> anonymousSingnIn() async {
  late final String userId;

  try {
    // 匿名サインインを実施
    final credential = await _auth.signInAnonymously();

    // 結果から現在ユーザーIDを取得
    userId = credential.user!.uid;
  } on Exception catch (_) {
    throw errors.signInAnonymouslyErr;
  }

  return userId;
}

/// Googleサインインを行い、結果からOAuthCredentialを作成する
Future<OAuthCredential?> googleSingnIn() async {
  late final OAuthCredential credential;

  try {
    // Googleサインインをリクエストする
    final googleUser = await GoogleSignIn(scopes: ['email']).signIn();

    // 「キャンセル」が押された場合、nullが返ってくるので処理を終了する
    if (googleUser == null) {
      return null;
    }

    // リクエスト結果から認証情報を取得
    final googleAuth = await googleUser.authentication;

    // 認証情報からOAuthCredentialを作成
    credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  } on Exception catch (_) {
    throw 'サインインに失敗しました。';
  }

  return credential;
}
