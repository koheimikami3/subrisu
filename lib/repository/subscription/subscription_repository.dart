import 'package:subrisu/importer.dart';

abstract class SubscriptionRepository {
  Stream<QuerySnapshot> getSubscriptions(String userId);

  Future<void> create(String userId, SubscriptionData data);

  Future<void> delete(String userId, String subscriptionId);
}
