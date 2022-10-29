import '../importer.dart';

/// 各データのcreatedAtを作成する
///
/// Firebaseのサーバー時間取得する
class CreatedAtField implements JsonConverter<DateTime?, dynamic> {
  const CreatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  dynamic toJson(DateTime? dateTime) {
    if (dateTime == null) return FieldValue.serverTimestamp();
    return dateTime;
  }
}
