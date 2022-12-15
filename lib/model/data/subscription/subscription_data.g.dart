// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionData _$$_SubscriptionDataFromJson(Map<String, dynamic> json) =>
    _$_SubscriptionData(
      serviceName: json['serviceName'] as String,
      iconImagePath: json['iconImagePath'] as String? ?? '',
      price: json['price'] as String,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      updatedAt: const UpdatedAtField().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_SubscriptionDataToJson(_$_SubscriptionData instance) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'iconImagePath': instance.iconImagePath,
      'price': instance.price,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'updatedAt': const UpdatedAtField().toJson(instance.updatedAt),
    };
