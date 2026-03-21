import '../../../importer.dart';

part 'subscriptions_provider.g.dart';

/// ユーザーのSubscriptionリストを取得するStreamProvider
///
/// 作成日時を基準に昇順に並び替える
@riverpod
Stream<List<Subscription>> subscriptions(Ref ref) {
  return ref
      .read(subscriptionsCollectionProvider)
      .orderBy(FirestoreConstants.createdAtField)
      .withConverter<Subscription>(
        fromFirestore: Subscription.fromFirestore,
        toFirestore: (subscription, _) => subscription.toFirestore(),
      )
      .snapshots()
      .map((query) => query.docs.map((doc) => doc.data()).toList());
}
