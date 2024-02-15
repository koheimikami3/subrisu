import '../../../importer.dart';

part 'firebase_messaging_provider.g.dart';

/// FirebaseMessagingのProvider
@riverpod
FirebaseMessaging firebaseMessaging(FirebaseMessagingRef ref) {
  return FirebaseMessaging.instance;
}
