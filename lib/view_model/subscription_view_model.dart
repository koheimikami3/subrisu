import 'package:subrisu/importer.dart';

class SubscriptionViewModel extends StateNotifier<List<QueryDocumentSnapshot>> {
  SubscriptionViewModel(this.repository, this.ref) : super([]);

  final SubscriptionRepository repository;
  final Ref ref;

  void getSubscriptions() {
    final userId = ref.watch(userViewModelProvider).userId;

    try {
      final stream = repository.getSubscriptions(userId);

      stream.listen((query) {
        state = query.docs;
      });
    } catch (_) {
      rethrow;
    }
  }

  Future<void> create() async {
    final userId = ref.watch(userViewModelProvider).userId;
    final serviceName = ref.read(serviceNameProvider);
    final price = ref.read(priceProvider);
    final iconImagePath = ref.read(resultIconImagePathProvider);
    final paymentCycle = ref.read(resultPaymentCycleProvider);
    final startedAt = ref.read(resultStartDateProvider);
    final notification = ref.read(notificationProvider);
    final memo = ref.read(memoProvider);

    try {
      // SubscriptionDataを作成
      final data = SubscriptionData(
        serviceName: serviceName,
        price: price,
        iconImagePath: iconImagePath,
        paymentCycle: paymentCycle,
        startedAt: startedAt,
        notification: notification,
        memo: memo,
      );

      // SubscriptionDocumentを作成
      await repository.create(userId, data);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> delete(String subscriptionId) async {
    final userId = ref.watch(userViewModelProvider).userId;

    try {
      // SubscriptionDocumentを削除
      await repository.delete(userId, subscriptionId);
    } catch (_) {
      rethrow;
    }
  }
}
