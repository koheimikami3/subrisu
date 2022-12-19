import '../importer.dart';

/// 各データのupdatedAtを作成する
///
/// Firebaseのサーバー時間取得する
class StartedAtField implements JsonConverter<DateTime?, dynamic> {
  const StartedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) {
    if (date == null) return null;

    return Timestamp.fromDate(date);
  }
}
