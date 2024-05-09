import '../importer.dart';

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
