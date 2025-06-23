import '../../../importer.dart';

part 'subscriptions_provider.g.dart';

/// ユーザーのSubscriptionリストを取得するStreamProvider
///
/// 作成日時を基準に昇順に並び替える
@riverpod
Stream<List<Subscription>> subscriptions(Ref ref) {
  final userId = ref.read(userIdProvider);
  return ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .collection(FirestoreConstants.subscriptionsCollection)
      .orderBy(FirestoreConstants.createdAtField)
      .withConverter<Subscription>(
        fromFirestore: Subscription.fromFirestore,
        toFirestore: (subscription, _) => subscription.toFirestore(),
      )
      .snapshots()
      .map((query) => query.docs.map((doc) => doc.data()).toList());
}
