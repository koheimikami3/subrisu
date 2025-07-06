import '../../../importer.dart';

part 'update_reminder_hour_provider.g.dart';

/// 指定された値でUserDocumentのreminder.hourを更新するFutureProvider
@riverpod
Future<void> updateReminderHour(Ref ref, int hour) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);

  await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    '${FirestoreConstants.reminderField}.${FirestoreConstants.hourField}': hour,
  });
}
