import '../../../importer.dart';

part 'create_subscription_provider.g.dart';

/// SubscriptionDocumentを作成するFutureProvider
@riverpod
Future<void> createSubscription(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final creationData = ref.read(subscriptionCreationDataProvider);

  // SubscriptionDocumentを作成
  await ref
      .read(firebaseFirestoreProvider)
      .collection('users')
      .doc(userId)
      .collection('subscriptions')
      .add(creationData.toJson());
}
