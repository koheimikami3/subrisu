import '../../../../../importer.dart';

part 'delete_subscription_provider.g.dart';

/// SubscriptionDocumentを削除するFutureProvider
@riverpod
Future<void> deleteSubscription(Ref ref, String subscriptionId) async {
  final userId = ref.read(userIdProvider);

  // SubscriptionDocumentを削除
  await ref
      .read(firebaseFirestoreProvider)
      .collection('users')
      .doc(userId)
      .collection('subscriptions')
      .doc(subscriptionId)
      .delete();
}
