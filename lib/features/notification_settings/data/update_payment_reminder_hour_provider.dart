import '../../../importer.dart';

part 'update_payment_reminder_hour_provider.g.dart';

/// 指定された値でUserDocumentの
/// notification.paymentReminder.hourを更新するFutureProvider
@riverpod
Future<void> updatePaymentReminderHour(Ref ref, int hour) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);
  const notificationsField = FirestoreConstants.notificationsField;
  const paymentReminderField = FirestoreConstants.paymentReminderField;
  const hourField = FirestoreConstants.hourField;

  await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    '$notificationsField.$paymentReminderField.$hourField': hour,
  });
}
