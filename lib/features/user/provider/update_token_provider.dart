import '../../../importer.dart';

part 'update_token_provider.g.dart';

/// UserDocumentのtokenを更新するFutureProvider
@riverpod
Future<void> updateToken(UpdateTokenRef ref) async {
  final userId = ref.read(userIdProvider);

  // 端末のFCMトークンを取得
  final token = await ref.read(firebaseMessagingProvider).getToken();

  // UserDocumentのtokenを更新
  await ref
      .read(firebaseFirestoreProvider)
      .collection('users')
      .doc(userId)
      .update({'token': token});
}
