import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';

part 'timezone_provider.g.dart';

/// 端末のタイムゾーン情報を取得するFutureProvider
@riverpod
Future<Map<String, dynamic>> timezone(Ref ref) async {
  final timezone = await FlutterTimezone.getLocalTimezone();
  final offset = DateTime.now().timeZoneOffset.inHours;

  return {
    FirestoreConstants.timezoneNameField: timezone,
    FirestoreConstants.timezoneUtcOffsetField: offset,
  };
}
