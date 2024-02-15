/// サブスウリプションの並び替え設定
enum SubscriptionSort {
  /// 次回支払日までの日数を基準に昇順
  ascendingNextPaymentDays('支払い日が近い順'),

  /// 価格を基準に昇順
  ascendingPrice('料金が安い順'),

  /// 価格を基準に降順
  descendingPrice('料金が高い順'),

  /// サービスを基準に昇順
  ascendingServiceName('名前順（昇順）'),

  /// 価格を基準に降順
  descendingServiceName('名前順（降順）'),
  ;

  const SubscriptionSort(this.name);

  final String name;
}
