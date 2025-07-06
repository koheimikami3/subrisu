import 'package:subrisu/importer.dart';

part 'subscription_data.freezed.dart';
part 'subscription_data.g.dart';

/// SubscriptionDocumentを作成または更新するためのDTOクラス
@freezed
abstract class SubscriptionData implements _$SubscriptionData {
  const factory SubscriptionData({
    // サービス名
    required String serviceName,

    // 価格
    required num price,

    // アイコン画像パス
    required String iconImagePath,

    // 支払い周期
    required String paymentCycle,

    // 初回支払日
    @FirstPaidOnField() required DateTime firstPaidOn,

    // メモ
    required String? note,
  }) = _SubscriptionData;

  const SubscriptionData._();

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataFromJson(json);
}
