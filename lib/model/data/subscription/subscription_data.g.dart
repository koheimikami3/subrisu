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
      paymentMethod: json['paymentMethod'] as int,
      startedAt: const StartedAtField().fromJson(json['startedAt']),
      notification: json['notification'] as bool,
      notificationId: json['notificationId'] as int?,
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
      'paymentMethod': instance.paymentMethod,
      'startedAt': const StartedAtField().toJson(instance.startedAt),
      'notification': instance.notification,
      'notificationId': instance.notificationId,
      'memo': instance.memo,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'updatedAt': const UpdatedAtField().toJson(instance.updatedAt),
    };
