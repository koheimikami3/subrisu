import '../../../importer.dart';

part 'firebase_remote_config_provider.g.dart';

/// FirebaseRemoteConfigのProvider
@riverpod
FirebaseRemoteConfig firebaseRemoteConfig(FirebaseRemoteConfigRef ref) {
  return FirebaseRemoteConfig.instance;
}
