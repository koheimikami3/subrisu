import '../../../importer.dart';

part 'create_user_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentを作成するFutureProvider
@riverpod
Future<void> createUser(Ref ref, String userId) async {
  late final String os;

  // 端末のOSを取得
  if (Platform.isIOS) {
    os = AppPlatform.iOS.name;
  } else if (Platform.isAndroid) {
    os = AppPlatform.android.name;
  }

  // 端末のFCMトークンを取得
  final token = await ref.read(fcmTokenProvider.future);

  // 端末のタイムゾーン情報を取得
  final timezone = await ref.read(timezoneProvider.future);

  // UserDocumentの作成データ
  final userData = CreateUserData(
    os: os,
    token: token!,
    timezone: timezone,
    reminder: {
      FirestoreConstants.isEnabled: AppConfigs.defaultReminderIsEnabled,
      FirestoreConstants.daysBeforeField: AppConfigs.defaultReminderDaysBefore,
      FirestoreConstants.hourField: AppConfigs.defaultReminderHour,
    },
  );

  // UserDocumentを作成
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .set(userData.toJson());
}
