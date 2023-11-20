import 'package:subrisu/importer.dart';

/// SubscriptionRepositoryの抽象クラス
abstract class SubscriptionRepository {
  Stream<QuerySnapshot> getSubscriptions(String userId);

  Future<void> create(String userId, CreateSubscriptionData data);

  Future<void> update(
    String userId,
    String subscId,
    CreateSubscriptionData data,
  );

  Future<void> delete(String userId, String subscriptionId);
}
