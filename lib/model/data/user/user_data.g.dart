// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      userId: json['userId'] as String? ?? '',
      os: json['os'] as String,
      token: json['token'] as String,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'os': instance.os,
      'token': instance.token,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
