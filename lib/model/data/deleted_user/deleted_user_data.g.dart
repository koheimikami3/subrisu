// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_DeletedUserData _$$_DeletedUserDataFromJson(Map<String, dynamic> json) =>
    _$_DeletedUserData(
      userId: json['userId'] as String,
      os: json['os'] as String,
      deletedAt: const CreatedAtField().fromJson(json['deletedAt']),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_DeletedUserDataToJson(_$_DeletedUserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'os': instance.os,
      'deletedAt': const CreatedAtField().toJson(instance.deletedAt),
    };
