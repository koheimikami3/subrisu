import '../../../importer.dart';

part 'update_user_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentを更新するFutureProvider
@riverpod
Future<void> updateUser(Ref ref) async {
  final userId = ref.read(userIdProvider);

  // 端末のFCMトークンを取得
  final token = await ref.read(fcmTokenProvider.future);

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
