import '../../../importer.dart';

part 'firebase_remote_config_provider.g.dart';

/// FirebaseRemoteConfigのProvider
@riverpod
FirebaseRemoteConfig firebaseRemoteConfig(Ref ref) {
  return FirebaseRemoteConfig.instance;
}
