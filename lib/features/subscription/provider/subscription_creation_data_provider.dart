import '../../../../importer.dart';

part 'subscription_creation_data_provider.g.dart';

/// SubscriptionCreationDataを作成するProvider
@riverpod
SubscriptionCreationData subscriptionCreationData(
  SubscriptionCreationDataRef ref,
) {
  final formState = ref.read(subscriptionFormNotifierProvider);
  var iconImagePath = formState.resultIconImagePath;

  // アイコン画像未設定の場合、サブリスアイコンにする
  if (iconImagePath.isEmpty) {
    iconImagePath = Assets.images.subscription.subrisu.path;
  }

  // 初回支払日を作成
  final firstPaidOn = DateTime(
    formState.firstPaidYear!,
    formState.firstPaidMonth!,
    formState.firstPaidDay!,
  );

  // SubscriptionDocumentの作成データ
  final creationData = SubscriptionCreationData(
    serviceName: formState.serviceName,
    price: formState.price,
    iconImagePath: iconImagePath,
    paymentCycle: formState.paymentCycle,
    firstPaidOn: firstPaidOn,
    notification: formState.notification,
    memo: formState.memo,
  );
  return creationData;
}
