// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionDataImpl _$$SubscriptionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionDataImpl(
      serviceName: json['serviceName'] as String,
      price: json['price'] as num,
      iconImagePath: json['iconImagePath'] as String,
      paymentCycle: json['paymentCycle'] as String,
      firstPaidOn: const FirstPaidOnField().fromJson(json['firstPaidOn']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$SubscriptionDataImplToJson(
        _$SubscriptionDataImpl instance) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'price': instance.price,
      'iconImagePath': instance.iconImagePath,
      'paymentCycle': instance.paymentCycle,
      'firstPaidOn': const FirstPaidOnField().toJson(instance.firstPaidOn),
      'note': instance.note,
    };
