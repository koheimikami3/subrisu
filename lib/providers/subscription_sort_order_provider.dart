import '../../../importer.dart';

part 'subscription_sort_order_provider.g.dart';

/// サブスクリプションリストの並び替え設定を管理するNotifierProvider
@riverpod
class SubscriptionSortOrderNotifier extends _$SubscriptionSortOrderNotifier {
  @override
  SubscriptionSortOrder build() {
    final prefs = ref.read(sharedPreferencesProvider);

    // 並び替えの設定状況を取得
    // 未設定の場合、次回支払日までの日数を基準に昇順に設定
    final sortOrder =
        prefs.getString(SheredPreferencesKeys.subscriptionSortOrder) ??
            SubscriptionSortOrder.nextPaymentAsc.name;

    return SubscriptionSortOrder.values.byName(sortOrder);
  }

  /// 状態を指定したSubscriptionSortOrderに更新
  ///
  /// 並び替え設定をSharedPreferencesに保存
  void set(SubscriptionSortOrder value) {
    final prefs = ref.read(sharedPreferencesProvider);

    state = value;
    prefs.setString(SheredPreferencesKeys.subscriptionSortOrder, value.name);
  }
}
