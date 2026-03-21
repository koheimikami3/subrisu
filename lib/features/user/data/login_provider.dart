import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/features/user/data/create_user_provider.dart';
import 'package:subrisu/features/user/data/firebase_auth_provider.dart';
import 'package:subrisu/features/user/data/update_user_provider.dart';
import 'package:subrisu/providers/firebase_remote_config_provider.dart';

part 'login_provider.g.dart';

/// ログインを実施するFutureProvider
///
/// RemoteConfigを取得する
/// 初回はFirebaseに匿名サインインする
/// 以降はUserDocumentのtoken(FCMトークン)を更新することでログイン完了とする
@riverpod
Future<void> login(Ref ref) async {
  final auth = ref.read(firebaseAuthProvider);
  final user = auth.currentUser;

  // RemoteConfigを取得
  await ref.read(firebaseRemoteConfigProvider).fetchAndActivate();

  // Firebaseにサインインしていない場合
  if (user == null) {
    // 匿名サインインを実施
    final credential = await FirebaseAuth.instance.signInAnonymously();

    // 結果から認証IDを取得
    final userId = credential.user!.uid;

    // UserDocumentを作成
    await ref.read(createUserProvider(userId).future);
  } else {
    // UserDocumentを更新
    await ref.read(updateUserProvider.future);
  }
}
