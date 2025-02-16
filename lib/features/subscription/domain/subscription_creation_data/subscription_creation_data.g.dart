// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_creation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionCreationDataImpl _$$SubscriptionCreationDataImplFromJson(
  Map<String, dynamic> json,
) =>
    _$SubscriptionCreationDataImpl(
      serviceName: json['serviceName'] as String,
      price: json['price'] as String,
      iconImagePath: json['iconImagePath'] as String? ?? '',
      paymentCycle: json['paymentCycle'] as int,
      firstPaidOn: const FirstPaidOnField().fromJson(json['firstPaidOn']),
      notification: json['notification'] as bool,
      memo: json['memo'] as String,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      updatedAt: const UpdatedAtField().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$SubscriptionCreationDataImplToJson(
  _$SubscriptionCreationDataImpl instance,
) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'price': instance.price,
      'iconImagePath': instance.iconImagePath,
      'paymentCycle': instance.paymentCycle,
      'firstPaidOn': const FirstPaidOnField().toJson(instance.firstPaidOn),
      'notification': instance.notification,
      'memo': instance.memo,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'updatedAt': const UpdatedAtField().toJson(instance.updatedAt),
    };
