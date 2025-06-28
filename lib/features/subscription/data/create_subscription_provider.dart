import '../../../importer.dart';

part 'create_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを作成するFutureProvider
@riverpod
Future<void> createSubscription(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final formState = ref.read(subscriptionFormNotifierProvider);
  final note = formState.note.isEmpty ? null : formState.note;
  late final DateTime firstPaidOn;

  // アイコン画像が未設定の場合、サブリスアイコンを使用
  final iconImagePath = formState.resultIconImagePath.isEmpty
      ? Assets.images.subscription.subrisu.path
      : formState.resultIconImagePath;

  // 初回支払日が未設定の場合、現在の日付を使用
  if (formState.firstPaidYear == null) {
    firstPaidOn = DateTime.now();
  } else {
    firstPaidOn = DateTime(
      formState.firstPaidYear!,
      formState.firstPaidMonth!,
      formState.firstPaidDay!,
    );
  }

  // SubscriptionDocumentの作成データ
  final subscriptionData = SubscriptionData(
    serviceName: formState.serviceName,
    price: num.parse(formState.price),
    iconImagePath: iconImagePath,
    paymentCycle: formState.paymentCycle.name,
    firstPaidOn: firstPaidOn,
    isNotificationEnabled: formState.isNotificationEnabled,
    note: note,
  );

  // SubscriptionDocumentを作成するためのJSONデータ
  // createdAtフィールドはサーバータイムスタンプを使用
  final json = subscriptionData.toJson();
  json[FirestoreConstants.createdAtField] = FieldValue.serverTimestamp();

  // SubscriptionDocumentを作成
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .collection(FirestoreConstants.subscriptionsCollection)
      .add(json);
}
