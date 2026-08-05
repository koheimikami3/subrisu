import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/providers/subscriptions_collection_provider.dart';

part 'delete_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを削除するFutureProvider
@riverpod
Future<void> deleteSubscription(Ref ref, String subscriptionId) async {
  // SubscriptionDocumentを削除
  await ref.read(subscriptionsCollectionProvider).doc(subscriptionId).delete();
}
