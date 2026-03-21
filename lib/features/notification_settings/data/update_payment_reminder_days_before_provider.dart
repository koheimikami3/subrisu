import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/providers/firebase_firestore_provider.dart';
import 'package:subrisu/providers/user_id_provider.dart';

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
