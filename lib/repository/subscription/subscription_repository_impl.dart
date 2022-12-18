import '../../constant/errors.dart' as errors;
import '../../importer.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  SubscriptionRepositoryImpl();

  final _db = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot> getSubscriptions(String userId) {
    try {
      final stream = _db
          .collection('users')
          .doc(userId)
          .collection('subscriptions')
          .orderBy('createdAt', descending: true)
          .snapshots();
      return stream;
    } catch (_) {
      throw '';
    }
  }

  @override
  Future<void> create(String userId, SubscriptionData data) async {
    try {
      await _db
          .collection('users')
          .doc(userId)
          .collection('subscriptions')
          .add(data.toJson());
    } catch (_) {
      throw errors.createSubscriptionErr;
    }
  }

  @override
  Future<void> delete(String userId, String subscriptionId) async {
    try {
      await _db
          .collection('users')
          .doc(userId)
          .collection('subscriptions')
          .doc(subscriptionId)
          .delete();
    } catch (_) {
      throw errors.deleteSubscriptionErr;
    }
  }
}
