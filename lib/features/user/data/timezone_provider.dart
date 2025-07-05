import '../../../importer.dart';

part 'timezone_provider.g.dart';

/// 端末のタイムゾーン情報を取得するFutureProvider
@riverpod
Future<Map<String, dynamic>> timezone(Ref ref) async {
  final timezone = await FlutterTimezone.getLocalTimezone();
  final offset = DateTime.now().timeZoneOffset.inHours;

  return {
    FirestoreConstants.timezoneNameField: timezone,
    FirestoreConstants.timezoneOffsetField: offset,
  };
}
