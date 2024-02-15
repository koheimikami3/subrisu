import 'package:subrisu/importer.dart';

part 'subscription_creation_data.freezed.dart';
part 'subscription_creation_data.g.dart';

/// SubscriptionDocumentの作成データ
@freezed
abstract class SubscriptionCreationData implements _$SubscriptionCreationData {
  const factory SubscriptionCreationData({
    required String serviceName,
    required String price,
    @Default('') String iconImagePath,
    required int paymentCycle,
    @FirstPaidOnField() DateTime? firstPaidOn,
    required bool notification,
    required String memo,
    @CreatedAtField() DateTime? createdAt,
    @UpdatedAtField() DateTime? updatedAt,
  }) = _SubscriptionCreationData;

  const SubscriptionCreationData._();

  factory SubscriptionCreationData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionCreationDataFromJson(json);
}
