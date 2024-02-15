import '../../../importer.dart';

part 'user_id_provider.g.dart';

/// FirebaseAuthのCurrentUserIdを取得するProvider
@riverpod
String userId(UserIdRef ref) {
  return ref.read(firebaseAuthProvider).currentUser!.uid;
}
