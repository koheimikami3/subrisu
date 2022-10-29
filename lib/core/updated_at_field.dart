import '../importer.dart';

/// 各データのupdatedAtを作成する
///
/// Firebaseのサーバー時間取得する
class UpdatedAtField implements JsonConverter<DateTime?, dynamic> {
  const UpdatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  FieldValue toJson(DateTime? date) {
    return FieldValue.serverTimestamp();
  }
}
