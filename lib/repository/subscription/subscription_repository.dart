import 'package:subrisu/importer.dart';

abstract class SubscriptionRepository {
  Future<void> create(String userId, SubscriptionData data);
}
