// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeleteUserData _$$_DeleteUserDataFromJson(Map<String, dynamic> json) =>
    _$_DeleteUserData(
      userId: json['userId'] as String,
      os: json['os'] as String,
      deletedAt: const CreatedAtField().fromJson(json['deletedAt']),
    );

Map<String, dynamic> _$$_DeleteUserDataToJson(_$_DeleteUserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'os': instance.os,
      'deletedAt': const CreatedAtField().toJson(instance.deletedAt),
    };
