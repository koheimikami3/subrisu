import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/providers/firebase_firestore_provider.dart';
import 'package:subrisu/providers/user_id_provider.dart';

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
