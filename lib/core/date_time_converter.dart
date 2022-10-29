import '../importer.dart';

class DateTimeConverter {
  static Timestamp fromDateTime(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }

  static DateTime toDateTime(dynamic timestamp) {
    return timestamp.toDate();
  }
}
