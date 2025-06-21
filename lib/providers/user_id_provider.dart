import '../../../importer.dart';

part 'user_id_provider.g.dart';

/// FirebaseAuthのCurrentUserIdを提供するProvider
@riverpod
String userId(Ref ref) => ref.read(firebaseAuthProvider).currentUser!.uid;
