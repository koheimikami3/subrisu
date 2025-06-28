import '../importer.dart';

/// firstPaidOnFieldフィールドのDateTime/Timestamp変換を行うクラス
class FirstPaidOnField implements JsonConverter<DateTime, dynamic> {
  const FirstPaidOnField();

  @override
  DateTime fromJson(dynamic timestamp) {
    if (timestamp is Timestamp) {
      final dateTime = timestamp.toDate();

      // 読み込み時も日付のみに正規化
      return DateTime(dateTime.year, dateTime.month, dateTime.day);
    }

    throw FormatException(
      'Cannot convert ${timestamp.runtimeType} to DateTime',
    );
  }

  @override
  Timestamp toJson(DateTime dateTime) {
    // 時間・分・秒を切り捨てた日付を作成
    final date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return Timestamp.fromDate(date);
  }
}
