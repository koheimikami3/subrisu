import '../../../importer.dart';

part 'reminder_is_enabled_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentのリマインダー設定が有効かどうかを取得するStreamProvider
@riverpod
Stream<bool?> reminderIsEnabled(Ref ref) {
  final userId = ref.read(userIdProvider);
  final firestore = ref.read(firebaseFirestoreProvider);

  return firestore
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .snapshots()
      .map((doc) {
    final data = doc.data();
    final reminder =
        data?[FirestoreConstants.reminderField] as Map<String, dynamic>?;
    return reminder?[FirestoreConstants.isEnabled] as bool?;
  });
}
