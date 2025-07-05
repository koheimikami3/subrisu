// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateUserDataImpl _$$CreateUserDataImplFromJson(Map<String, dynamic> json) =>
    _$CreateUserDataImpl(
      os: json['os'] as String,
      token: json['token'] as String,
      timezone: json['timezone'] as Map<String, dynamic>,
      paymentReminder: Map<String, int>.from(json['paymentReminder'] as Map),
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$CreateUserDataImplToJson(
        _$CreateUserDataImpl instance) =>
    <String, dynamic>{
      'os': instance.os,
      'token': instance.token,
      'timezone': instance.timezone,
      'paymentReminder': instance.paymentReminder,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
