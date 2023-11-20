import 'package:subrisu/importer.dart';

class SubscriptionViewModel extends StateNotifier<List<QueryDocumentSnapshot>> {
  SubscriptionViewModel(this.repository, this.ref) : super([]);

  final SubscriptionRepository repository;
  final Ref ref;

  /// サブスクリプションデータをリアルタイムで取得する
  void getSubscriptions() {
    final userId = ref.read(userViewModelProvider).userId;

    repository.getSubscriptions(userId).listen(
      (subscriptions) {
        state = subscriptions.docs;

        // リスト画面のプログレスダイアログを閉じる
        ref.read(isUserLoadedProvider.notifier).state = true;
      },
      onError: (_) {
        // リスト画面にログインエラーメッセージを表示
        ref.read(loginErrorProvider.notifier).state = true;
      },
    );
  }

  /// サブスクリプションデータを作成する
  Future<void> create() async {
    final userId = ref.read(userViewModelProvider).userId;
    final serviceName = ref.read(serviceNameProvider);
    final price = ref.read(priceProvider);
    var iconImagePath = ref.read(resultIconImagePathProvider);
    final paymentCycle = ref.read(paymentCycleProvider);
    final notification = ref.read(notificationProvider);
    final memo = ref.read(memoProvider);

    // アイコン画像未設定の場合、サブリスアイコンにする
    if (iconImagePath.isEmpty) {
      iconImagePath = Assets.images.subscription.subrisu.path;
    }

    // 初回支払日を作成
    final year = ref.read(firstPaidYearProvider);
    final month = ref.read(firstPaidMonthProvider);
    final day = ref.read(firstPaidDayProvider);
    final firstPaidOn = DateTime(year, month, day);

    // SubscriptionDataを作成
    final data = CreateSubscriptionData(
      serviceName: serviceName,
      price: price,
      iconImagePath: iconImagePath,
      paymentCycle: paymentCycle,
      firstPaidOn: firstPaidOn,
      notification: notification,
      memo: memo,
    );

    try {
      await repository.create(userId, data);
    } on Exception {
      rethrow;
    }
  }

  /// サブスクリプションデータを更新する
  Future<void> update(String subscId, DateTime createdAt) async {
    final userId = ref.read(userViewModelProvider).userId;
    final serviceName = ref.read(serviceNameProvider);
    final price = ref.read(priceProvider);
    final iconImagePath = ref.read(resultIconImagePathProvider);
    final paymentCycle = ref.read(paymentCycleProvider);
    final notification = ref.read(notificationProvider);
    final memo = ref.read(memoProvider);

    // 初回支払日を作成
    final year = ref.read(firstPaidYearProvider);
    final month = ref.read(firstPaidMonthProvider);
    final day = ref.read(firstPaidDayProvider);
    final firstPaidOn = DateTime(year, month, day);

    // SubscriptionDataを作成
    final data = CreateSubscriptionData(
      serviceName: serviceName,
      price: price,
      iconImagePath: iconImagePath,
      paymentCycle: paymentCycle,
      firstPaidOn: firstPaidOn,
      notification: notification,
      memo: memo,
      createdAt: createdAt,
    );

    try {
      await repository.update(userId, subscId, data);
    } on Exception {
      rethrow;
    }
  }

  /// サブスクリプションデータを削除する
  Future<void> delete(String subscriptionId) async {
    final userId = ref.read(userViewModelProvider).userId;

    try {
      await repository.delete(userId, subscriptionId);
    } on Exception {
      rethrow;
    }
  }
}
