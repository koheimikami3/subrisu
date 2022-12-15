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
    final serviceName = ref.watch(serviceNameProvider);
    final price = ref.watch(priceProvider);

    try {
      // SubscriptionDataを作成
      final data = SubscriptionData(
        serviceName: serviceName,
        price: price,
      );

      // SubscriptionDocumentを作成
      await repository.create(userId, data);
    } catch (_) {
      rethrow;
    }
  }
}
