// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionData _$$_SubscriptionDataFromJson(Map<String, dynamic> json) =>
    _$_SubscriptionData(
      serviceName: json['serviceName'] as String,
      price: json['price'] as String,
      iconImagePath: json['iconImagePath'] as String? ?? '',
      paymentCycle: json['paymentCycle'] as int,
      firstPaidAt: const FirstPaidAtField().fromJson(json['firstPaidAt']),
      notification: json['notification'] as bool,
      memo: json['memo'] as String,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      updatedAt: const UpdatedAtField().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_SubscriptionDataToJson(_$_SubscriptionData instance) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'price': instance.price,
      'iconImagePath': instance.iconImagePath,
      'paymentCycle': instance.paymentCycle,
      'firstPaidAt': const FirstPaidAtField().toJson(instance.firstPaidAt),
      'notification': instance.notification,
      'memo': instance.memo,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'updatedAt': const UpdatedAtField().toJson(instance.updatedAt),
    };
