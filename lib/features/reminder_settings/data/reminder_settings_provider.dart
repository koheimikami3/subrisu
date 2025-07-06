import '../../../importer.dart';

part 'reminder_settings_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentのreminderを取得するFutureProvider
@riverpod
Future<ReminderSettings> reminderSettings(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);

  // UserDocumentを取得し、ReminderSettingsに変換
  final settings = await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .withConverter<ReminderSettings>(
        fromFirestore: ReminderSettings.fromFirestore,
        toFirestore: (reminderSettings, _) => reminderSettings.toFirestore(),
      )
      .get();

  return settings.data()!;
}
