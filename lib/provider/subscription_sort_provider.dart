import '../../../importer.dart';

part 'subscription_sort_provider.g.dart';

/// サブスクリプションの並び替え設定のNotifierProvider
@riverpod
class SubscriptionSortNotifier extends _$SubscriptionSortNotifier {
  @override
  SubscriptionSort build() => SubscriptionSort.ascendingNextPaymentDays;

  /// 設定の状態を更新
  // ignore: use_setters_to_change_properties
  void setSetting(SubscriptionSort value) {
    state = value;
  }
}
