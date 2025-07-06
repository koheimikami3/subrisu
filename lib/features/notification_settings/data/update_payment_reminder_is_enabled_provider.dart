import '../../../importer.dart';

part 'update_payment_reminder_is_enabled_provider.g.dart';

/// 指定された値でUserDocumentの
/// notification.paymentReminder.isEnabledを更新するFutureProvider
@riverpod
Future<void> updateReminderIsEnabled(Ref ref, bool isEnabled) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);
  const notificationsField = FirestoreConstants.notificationsField;
  const paymentReminderField = FirestoreConstants.paymentReminderField;
  const isEnabledField = FirestoreConstants.isEnabled;

  await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    '$notificationsField.$paymentReminderField.$isEnabledField': isEnabled,
  });
}
