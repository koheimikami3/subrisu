import '../importer.dart';

/// firstPaidOnFieldフィールドのDateTime/Timestamp変換を行うクラス
class FirstPaidOnField implements JsonConverter<DateTime?, dynamic> {
  const FirstPaidOnField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  Timestamp toJson(DateTime? dateTime) {
    // 時間・分・秒を切り捨てた日付を作成
    final date = DateTime(dateTime!.year, dateTime.month, dateTime.day);
    return Timestamp.fromDate(date);
  }
}
