import '../../../importer.dart';

part 'delete_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを削除するFutureProvider
@riverpod
Future<void> deleteSubscription(Ref ref, String subscriptionId) async {
  // SubscriptionDocumentを削除
  await ref.read(subscriptionsCollectionProvider).doc(subscriptionId).delete();
}
