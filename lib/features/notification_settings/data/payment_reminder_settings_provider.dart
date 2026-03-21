import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/features/notification_settings/domain/payment_reminder_settings.dart';
import 'package:subrisu/providers/firebase_firestore_provider.dart';
import 'package:subrisu/providers/user_id_provider.dart';

part 'payment_reminder_settings_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentの
/// notification.paymentReminderを取得するFutureProvider
@riverpod
Future<PaymentReminderSettings> paymentReminderSettings(Ref ref) async {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);

  // UserDocumentを取得し、PaymentReminderSettingsに変換
  final settings = await firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .withConverter<PaymentReminderSettings>(
        fromFirestore: PaymentReminderSettings.fromFirestore,
        toFirestore: (settings, _) => settings.toFirestore(),
      )
      .get();

  return settings.data()!;
}
