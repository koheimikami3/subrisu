import '../../../importer.dart';

part 'update_reminder_days_before_provider.g.dart';

/// 指定された値でUserDocumentのreminder.daysBeforeを更新するFutureProvider
@riverpod
Future<void> updateReminderDaysBefore(Ref ref, int daysBefore) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);

  await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    '${FirestoreConstants.reminderField}.${FirestoreConstants.daysBeforeField}':
        daysBefore,
  });
}
