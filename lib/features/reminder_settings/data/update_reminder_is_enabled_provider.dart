import '../../../importer.dart';

part 'update_reminder_is_enabled_provider.g.dart';

/// 指定されたbool値でUserDocumentのreminder.isEnabledを更新するFutureProvider
@riverpod
Future<void> updateReminderIsEnabled(Ref ref, bool isEnabled) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);

  await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    '${FirestoreConstants.reminderField}.${FirestoreConstants.isEnabled}':
        isEnabled,
  });
}
