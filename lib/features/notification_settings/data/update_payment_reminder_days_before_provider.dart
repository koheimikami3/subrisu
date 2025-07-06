import '../../../importer.dart';

part 'update_payment_reminder_days_before_provider.g.dart';

/// 指定された値でUserDocumentの
/// notification.paymentReminder.daysBeforeを更新するFutureProvider
@riverpod
Future<void> updatePaymentReminderDaysBefore(Ref ref, int daysBefore) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);
  const notificationsField = FirestoreConstants.notificationsField;
  const paymentReminderField = FirestoreConstants.paymentReminderField;
  const daysBeforeField = FirestoreConstants.daysBeforeField;

  await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    '$notificationsField.$paymentReminderField.$daysBeforeField': daysBefore,
  });
}
