import '../importer.dart';

/// updatedAtフィールドのDateTime/Timestamp変換を行うクラス
class UpdatedAtField implements JsonConverter<DateTime?, dynamic> {
  const UpdatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  FieldValue? toJson(DateTime? date) {
    return FieldValue.serverTimestamp();
  }
}
