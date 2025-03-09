// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_creation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCreationDataImpl _$$UserCreationDataImplFromJson(
  Map<String, dynamic> json,
) =>
    _$UserCreationDataImpl(
      os: json['os'] as String,
      token: json['token'] as String,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$UserCreationDataImplToJson(
  _$UserCreationDataImpl instance,
) =>
    <String, dynamic>{
      'os': instance.os,
      'token': instance.token,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
