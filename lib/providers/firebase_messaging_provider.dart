import '../../../importer.dart';

part 'firebase_messaging_provider.g.dart';

/// FirebaseMessagingのインスタンスを提供するProvider
@riverpod
FirebaseMessaging firebaseMessaging(Ref ref) => FirebaseMessaging.instance;
