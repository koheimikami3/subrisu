import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// createdAtフィールドのDateTime/Timestamp変換を行うクラス
class CreatedAtField implements JsonConverter<DateTime?, dynamic> {
  const CreatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  dynamic toJson(DateTime? dateTime) {
    if (dateTime == null) {
      return FieldValue.serverTimestamp();
    }
    return dateTime;
  }
}
