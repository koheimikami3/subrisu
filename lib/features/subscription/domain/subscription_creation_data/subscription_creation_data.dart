import 'package:subrisu/importer.dart';

part 'subscription_creation_data.freezed.dart';
part 'subscription_creation_data.g.dart';

/// SubscriptionDocumentの作成（更新）データ
@freezed
abstract class SubscriptionCreationData implements _$SubscriptionCreationData {
  const factory SubscriptionCreationData({
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
  }) = _SubscriptionCreationData;

  const SubscriptionCreationData._();

  factory SubscriptionCreationData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionCreationDataFromJson(json);
}
