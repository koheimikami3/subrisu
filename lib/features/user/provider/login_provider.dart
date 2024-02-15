import '../../../importer.dart';

part 'login_provider.g.dart';

/// ログインを実施するFutureProvider
///
/// 初回はFirebaseに匿名サインインする
/// 以降はUserDocumentのtokenを更新することでログイン完了とする
@riverpod
Future<void> login(LoginRef ref) async {
  final auth = ref.read(firebaseAuthProvider);
  final user = auth.currentUser;

  // Firebaseにサインインしていない場合
  if (user == null) {
    // 匿名サインインを実施
    final credential = await auth.signInAnonymously();

    // 結果から認証IDを取得
    final userId = credential.user!.uid;

    // UserDocumentを作成
    await ref.read(createUserProvider(userId).future);
  } else {
    await ref.read(updateTokenProvider.future);
  }
}
