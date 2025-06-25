import 'package:flutter/foundation.dart';

import '../../../importer.dart';

part 'update_token_provider.g.dart';

/// UserDocumentのtokenを更新するFutureProvider
@riverpod
Future<void> updateToken(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final messaging = ref.read(firebaseMessagingProvider);

  // 端末のFCMトークンを取得
  // エミュレーターでgetToken()を使用するとエラーになるため、
  // リリースモードではgetToken()を使用し、デバッグモードではgetAPNSToken()を使用
  final token = kReleaseMode
      ? await messaging.getToken()
      : await messaging.getAPNSToken();

  // UserDocumentのtokenを更新
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({FirestoreConstants.tokenField: token});
}
