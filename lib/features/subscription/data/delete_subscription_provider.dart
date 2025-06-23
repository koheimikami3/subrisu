import '../../../importer.dart';

part 'delete_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを削除するFutureProvider
@riverpod
Future<void> deleteSubscription(Ref ref, String subscriptionId) async {
  final userId = ref.read(userIdProvider);

  // SubscriptionDocumentを削除
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .collection(FirestoreConstants.subscriptionsCollection)
      .doc(subscriptionId)
      .delete();
}
