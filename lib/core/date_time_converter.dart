import '../importer.dart';

class DateTimeConverter {
  Timestamp fromDateTime(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }

  DateTime toDateTime(Timestamp timestamp) {
    return timestamp.toDate();
  }
}
