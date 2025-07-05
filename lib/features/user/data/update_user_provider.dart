import 'package:flutter/foundation.dart';

import '../../../importer.dart';

part 'update_user_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentを更新するFutureProvider
@riverpod
Future<void> updateUser(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final messaging = ref.read(firebaseMessagingProvider);

  // 端末のFCMトークンを取得
  // エミュレーターでgetToken()を使用するとエラーになるため、
  // リリースモードではgetToken()を使用し、デバッグモードではgetAPNSToken()を使用
  final token = kReleaseMode
      ? await messaging.getToken()
      : await messaging.getAPNSToken();

  // 端末のタイムゾーン情報を取得
  final timezone = await ref.read(timezoneProvider.future);

  // UserDocumentのtokenを更新
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    FirestoreConstants.tokenField: token,
    FirestoreConstants.timezoneField: timezone,
  });
}
