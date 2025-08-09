import 'package:flutter/foundation.dart';

import '../../../importer.dart';

part 'fcm_token_provider.g.dart';

/// 端末のFCMトークンを取得するFutureProvider
///
/// エミュレーターでgetToken()を使用するとエラーになるため、
/// リリースモードではgetToken()を使用し、デバッグモードでNULLを返す
@riverpod
Future<String?> fcmToken(Ref ref) async {
  final messaging = ref.read(firebaseMessagingProvider);

  return kReleaseMode ? await messaging.getToken() : null;
}
