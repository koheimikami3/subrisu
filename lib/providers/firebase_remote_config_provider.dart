import '../../../importer.dart';

part 'firebase_remote_config_provider.g.dart';

/// FirebaseRemoteConfigのインスタンスを提供するProvider
@riverpod
FirebaseRemoteConfig firebaseRemoteConfig(Ref ref) {
  return FirebaseRemoteConfig.instance;
}
