import '../importer.dart';

class FirstPaidOnField implements JsonConverter<DateTime?, dynamic> {
  const FirstPaidOnField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  Timestamp toJson(DateTime? date) {
    // 時間・分・秒を切り捨てた日付を作成
    final result = DateTime(date!.year, date.month, date.day);

    return Timestamp.fromDate(result);
  }
}
