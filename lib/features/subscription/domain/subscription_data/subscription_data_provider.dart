import '../../../../../importer.dart';

part 'subscription_data_provider.g.dart';

/// SubscriptionDataを作成するProvider
@riverpod
SubscriptionData subscriptionData(Ref ref) {
  final formState = ref.read(subscriptionFormNotifierProvider);
  var iconImagePath = formState.resultIconImagePath;
  late final DateTime firstPaidOn;
  String? note = formState.note;

  // アイコン画像未設定の場合、サブリスアイコンにする
  if (iconImagePath.isEmpty) {
    iconImagePath = Assets.images.subscription.subrisu.path;
  }

  // 初回支払日を作成
  if (formState.firstPaidYear == null) {
    firstPaidOn = DateTime.now();
  } else {
    firstPaidOn = DateTime(
      formState.firstPaidYear!,
      formState.firstPaidMonth!,
      formState.firstPaidDay!,
    );
  }

  // メモが空の場合、nullに設定
  if (note.isEmpty) {
    note = null;
  }

  // SubscriptionDocumentの作成または更新データ
  final subscriptionData = SubscriptionData(
    serviceName: formState.serviceName,
    price: num.parse(formState.price),
    iconImagePath: iconImagePath,
    paymentCycle: formState.paymentCycle.name,
    firstPaidOn: firstPaidOn,
    isNotificationEnabled: formState.isNotificationEnabled,
    note: note,
  );
  return subscriptionData;
}
