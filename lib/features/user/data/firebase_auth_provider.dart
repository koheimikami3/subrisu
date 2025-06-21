import '../../../../../importer.dart';

part 'firebase_auth_provider.g.dart';

/// FirebaseAuthのインスタンスを提供するProvider
@riverpod
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;
