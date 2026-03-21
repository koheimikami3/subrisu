import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_remote_config_provider.g.dart';

/// FirebaseRemoteConfigのインスタンスを提供するProvider
@riverpod
FirebaseRemoteConfig firebaseRemoteConfig(Ref ref) {
  return FirebaseRemoteConfig.instance;
}
