import '../../../importer.dart';

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
