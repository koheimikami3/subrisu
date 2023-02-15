import 'package:subrisu/importer.dart';

class SubscriptionViewModel extends StateNotifier<List<QueryDocumentSnapshot>> {
  SubscriptionViewModel(this.repository, this.ref) : super([]);

  final SubscriptionRepository repository;
  final Ref ref;

  void getSubscriptions() {
    // watchを使用すると初回起動時に例外が発生
    final userId = ref.read(userViewModelProvider).userId;

    repository.getSubscriptions(userId).listen((subscriptions) {
      state = subscriptions.docs;

      // リスト画面のプログレスダイアログを閉じる
      ref.read(isUserLoadedProvider.notifier).state = true;
    });
  }

  Future<void> create() async {
    final userId = ref.read(userViewModelProvider).userId;
    final serviceName = ref.read(serviceNameProvider);
    final price = ref.read(priceProvider);
    final iconImagePath = ref.read(resultIconImagePathProvider);
    final paymentCycle = ref.read(paymentCycleProvider);
    final firstPaidOn = ref.read(firstPaidOnProvider);
    final notification = ref.read(notificationProvider);
    final memo = ref.read(memoProvider);

    try {
      // SubscriptionDataを作成
      final data = SubscriptionData(
        serviceName: serviceName,
        price: price,
        iconImagePath: iconImagePath,
        paymentCycle: paymentCycle,
        firstPaidOn: firstPaidOn,
        notification: notification,
        memo: memo,
      );

      // SubscriptionDocumentを作成
      await repository.create(userId, data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> update(String subscId, DateTime createdAt) async {
    final userId = ref.read(userViewModelProvider).userId;
    final serviceName = ref.read(serviceNameProvider);
    final price = ref.read(priceProvider);
    final iconImagePath = ref.read(resultIconImagePathProvider);
    final paymentCycle = ref.read(paymentCycleProvider);
    final firstPaidOn = ref.read(firstPaidOnProvider);
    final notification = ref.read(notificationProvider);
    final memo = ref.read(memoProvider);

    try {
      // SubscriptionDataを作成
      final data = SubscriptionData(
        serviceName: serviceName,
        price: price,
        iconImagePath: iconImagePath,
        paymentCycle: paymentCycle,
        firstPaidOn: firstPaidOn,
        notification: notification,
        memo: memo,
        createdAt: createdAt,
      );

      // SubscriptionDocumentを更新
      await repository.update(userId, subscId, data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> delete(String subscriptionId) async {
    final userId = ref.read(userViewModelProvider).userId;

    try {
      // SubscriptionDocumentを削除
      await repository.delete(userId, subscriptionId);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> allDelete() async {
    final userId = ref.read(userViewModelProvider).userId;

    try {
      // 全てのSubscriptionDocumentを削除
      await repository.allDelete(userId);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
