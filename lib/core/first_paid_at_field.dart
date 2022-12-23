import '../importer.dart';

class FirstPaidAtField implements JsonConverter<DateTime?, dynamic> {
  const FirstPaidAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) {
    return Timestamp.fromDate(date!);
  }
}
