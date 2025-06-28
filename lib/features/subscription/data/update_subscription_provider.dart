import '../../../importer.dart';

part 'update_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを更新するFutureProvider
@riverpod
Future<void> updateSubscription(Ref ref, String subscriptionId) async {
  final userId = ref.read(userIdProvider);
  final formState = ref.read(subscriptionFormNotifierProvider);
  final note = formState.note.isEmpty ? null : formState.note;
  final firstPaidOn = DateTime(
    formState.firstPaidYear!,
    formState.firstPaidMonth!,
    formState.firstPaidDay!,
  );

  // SubscriptionDocumentの更新データ
  final subscriptionData = SubscriptionData(
    serviceName: formState.serviceName,
    price: num.parse(formState.price),
    iconImagePath: formState.resultIconImagePath,
    paymentCycle: formState.paymentCycle.name,
    firstPaidOn: firstPaidOn,
    isNotificationEnabled: formState.isNotificationEnabled,
    note: note,
  );

  // SubscriptionDocumentを更新するためのJSONデータ
  // updatedAtフィールドはサーバータイムスタンプを使用
  final json = subscriptionData.toJson();
  json[FirestoreConstants.updatedAtField] = FieldValue.serverTimestamp();

  // SubscriptionDocumentを更新
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .collection(FirestoreConstants.subscriptionsCollection)
      .doc(subscriptionId)
      .update(json);
}
