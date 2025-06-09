import '../../../importer.dart';

part 'firebase_firestore_provider.g.dart';

/// FirebaseFirestoreのProvider
@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}
