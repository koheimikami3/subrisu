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
    required String price,

    // アイコン画像パス
    @Default('') String iconImagePath,

    // 支払い周期
    required int paymentCycle,

    // 初回支払日
    @FirstPaidOnField() DateTime? firstPaidOn,

    // 通知フラグ
    required bool notification,

    // メモ
    required String memo,

    // 作成日時
    @CreatedAtField() DateTime? createdAt,

    // 更新日時
    @UpdatedAtField() DateTime? updatedAt,
  }) = _SubscriptionData;

  const SubscriptionData._();

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataFromJson(json);
}
