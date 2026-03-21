import '../importer.dart';

part 'subscriptions_collection_provider.g.dart';

/// ユーザーのSubscriptionsコレクション参照を提供するProvider
@riverpod
CollectionReference<Map<String, dynamic>> subscriptionsCollection(Ref ref) {
  final userId = ref.read(userIdProvider);
  return ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .collection(FirestoreConstants.subscriptionsCollection);
}
