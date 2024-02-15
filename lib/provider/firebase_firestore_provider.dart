import '../../../importer.dart';

part 'firebase_firestore_provider.g.dart';

/// FirebaseFirestoreのProvider
@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}
