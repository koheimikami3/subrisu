import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/features/subscription/domain/subscription_data/subscription_data.dart';
import 'package:subrisu/features/subscription/presentation/subscription_form_provider.dart';
import 'package:subrisu/providers/subscriptions_collection_provider.dart';

part 'update_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを更新するFutureProvider
@riverpod
Future<void> updateSubscription(Ref ref, String subscriptionId) async {
  final formState = ref.read(subscriptionFormNotifierProvider);
  final note = formState.note.isEmpty ? null : formState.note;

  // SubscriptionDocumentの更新データ
  final subscriptionData = SubscriptionData(
    serviceName: formState.serviceName,
    price: num.parse(formState.price),
    iconImagePath: formState.resultIconImagePath,
    paymentCycle: formState.paymentCycle.name,
    firstPaidOn: formState.resultFirstPaidDate,
    note: note,
  );

  // SubscriptionDocumentを更新するためのJSONデータ
  // updatedAtフィールドはサーバータイムスタンプを使用
  final json = subscriptionData.toJson();
  json[FirestoreConstants.updatedAtField] = FieldValue.serverTimestamp();

  // SubscriptionDocumentを更新
  await ref
      .read(subscriptionsCollectionProvider)
      .doc(subscriptionId)
      .update(json);
}
