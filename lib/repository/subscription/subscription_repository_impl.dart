import 'package:subrisu/importer.dart';
import '../../constant/errors.dart' as errors;

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
}
