// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionDataImpl _$$SubscriptionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionDataImpl(
      serviceName: json['serviceName'] as String,
      price: json['price'] as String,
      iconImagePath: json['iconImagePath'] as String? ?? '',
      paymentCycle: (json['paymentCycle'] as num).toInt(),
      firstPaidOn: const FirstPaidOnField().fromJson(json['firstPaidOn']),
      notification: json['notification'] as bool,
      memo: json['memo'] as String,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      updatedAt: const UpdatedAtField().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$SubscriptionDataImplToJson(
        _$SubscriptionDataImpl instance) =>
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
