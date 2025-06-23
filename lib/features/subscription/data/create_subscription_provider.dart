import '../../../importer.dart';

part 'create_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを作成するFutureProvider
@riverpod
Future<void> createSubscription(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final subscriptionData = ref.read(subscriptionDataProvider);

  // SubscriptionDocumentを作成
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .collection(FirestoreConstants.subscriptionsCollection)
      .add(subscriptionData.toJson());
}
