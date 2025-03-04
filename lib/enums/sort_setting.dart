/// サブスウリプションの並び替え設定
enum SortSetting {
  /// 次回支払日までの日数を基準に昇順
  ascendingNextPaymentDays,

  /// 価格を基準に昇順
  ascendingPrice,

  /// 価格を基準に降順
  descendingPrice,

  /// サービスを基準に昇順
  ascendingServiceName,

  /// 価格を基準に降順
  descendingServiceName,
}
