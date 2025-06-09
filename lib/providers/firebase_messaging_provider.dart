import '../../../importer.dart';

part 'firebase_messaging_provider.g.dart';

/// FirebaseMessagingのProvider
@riverpod
FirebaseMessaging firebaseMessaging(Ref ref) {
  return FirebaseMessaging.instance;
}
