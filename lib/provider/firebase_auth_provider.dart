import '../../../importer.dart';

part 'firebase_auth_provider.g.dart';

/// FirebaseAuthのProvider
@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => FirebaseAuth.instance;
