import '../../../../../importer.dart';

part 'update_subscription_provider.g.dart';

/// SubscriptionDocumentを更新するFutureProvider
@riverpod
Future<void> updateSubscription(
  UpdateSubscriptionRef ref,
  String subscriptionId,
) async {
  final userId = ref.read(userIdProvider);
  final creationData = ref.read(subscriptionCreationDataProvider);

  // SubscriptionDocumentを更新
  await ref
      .read(firebaseFirestoreProvider)
      .collection('users')
      .doc(userId)
      .collection('subscriptions')
      .doc(subscriptionId)
      .update(creationData.toJson());
}
