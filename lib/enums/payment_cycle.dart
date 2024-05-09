/// 支払い周期
enum PaymentCycle {
  /// 毎日
  daily('毎日'),

  /// 毎週
  weekly('毎週'),

  /// 毎月
  monthly('毎月'),

  /// 3ヶ月
  threeMonths('3ヶ月'),

  /// 6ヶ月
  sixMonths('6ヶ月'),

  /// 毎年
  yearly('毎年'),
  ;

  const PaymentCycle(this.name);

  final String name;
}
