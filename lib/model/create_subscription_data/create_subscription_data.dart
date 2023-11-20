import 'package:subrisu/core/created_at_field.dart';
import 'package:subrisu/core/first_paid_on_field.dart';
import 'package:subrisu/core/updated_at_field.dart';
import 'package:subrisu/importer.dart';

part 'create_subscription_data.freezed.dart';
part 'create_subscription_data.g.dart';

@freezed
abstract class CreateSubscriptionData implements _$CreateSubscriptionData {
  const factory CreateSubscriptionData({
    required String serviceName,
    required String price,
    @Default('') String iconImagePath,
    required int paymentCycle,
    @FirstPaidOnField() DateTime? firstPaidOn,
    required bool notification,
    required String memo,
    @CreatedAtField() DateTime? createdAt,
    @UpdatedAtField() DateTime? updatedAt,
  }) = _CreateSubscriptionData;

  const CreateSubscriptionData._();

  factory CreateSubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionDataFromJson(json);
}
