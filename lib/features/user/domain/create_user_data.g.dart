// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateUserDataImpl _$$CreateUserDataImplFromJson(Map<String, dynamic> json) =>
    _$CreateUserDataImpl(
      os: json['os'] as String,
      fcmToken: json['fcmToken'] as String?,
      timezone: json['timezone'] as Map<String, dynamic>,
      notifications: json['notifications'] as Map<String, dynamic>,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$CreateUserDataImplToJson(
        _$CreateUserDataImpl instance) =>
    <String, dynamic>{
      'os': instance.os,
      'fcmToken': instance.fcmToken,
      'timezone': instance.timezone,
      'notifications': instance.notifications,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
