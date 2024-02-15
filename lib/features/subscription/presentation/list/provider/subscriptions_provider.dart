import '../../../../../importer.dart';

part 'subscriptions_provider.g.dart';

/// サブスクリプションリストを取得するStreamProvider
///
/// 作成日時を基準に昇順に並び替える
@riverpod
Stream<List<Subscription>> subscriptions(SubscriptionsRef ref) {
  final userId = ref.read(userIdProvider);
  return ref
      .read(firebaseFirestoreProvider)
      .collection('users')
      .doc(userId)
      .collection('subscriptions')
      .orderBy('createdAt')
      .withConverter<Subscription>(
        fromFirestore: Subscription.fromFirestore,
        toFirestore: (subscription, _) => subscription.toFirestore(),
      )
      .snapshots()
      .map((query) => query.docs.map((doc) => doc.data()).toList());
}
