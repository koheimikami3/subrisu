/// サブスウリプションリストの並び替え設定
enum SubscriptionSortOrder {
  /// 次回支払日までの日数を基準に昇順
  nextPaymentAsc,

  /// 価格を基準に昇順
  priceAsc,

  /// 価格を基準に降順
  priceDesc,

  /// サービスを基準に昇順
  serviceNameAsc,

  /// 価格を基準に降順
  serviceNameDesc,
}
