import '../../../importer.dart';

part 'firebase_firestore_provider.g.dart';

/// FirebaseFirestoreのインスタンスを提供するProvider
@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;
