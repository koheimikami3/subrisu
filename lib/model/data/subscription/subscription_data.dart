import 'package:subrisu/core/created_at_field.dart';
import 'package:subrisu/core/updated_at_field.dart';
import 'package:subrisu/importer.dart';

part 'subscription_data.freezed.dart';
part 'subscription_data.g.dart';

@freezed
abstract class SubscriptionData implements _$SubscriptionData {
  const SubscriptionData._();

  const factory SubscriptionData({
    required String serviceName,
    required String price,
    @Default('') String iconImagePath,
    required int paymentCycle,
    @UpdatedAtField() DateTime? startedAt,
    required bool notification,
    required String memo,
    @CreatedAtField() DateTime? createdAt,
    @UpdatedAtField() DateTime? updatedAt,
  }) = _SubscriptionData;

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataFromJson(json);
}
