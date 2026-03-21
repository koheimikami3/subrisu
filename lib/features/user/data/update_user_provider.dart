import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/features/user/data/fcm_token_provider.dart';
import 'package:subrisu/features/user/data/timezone_provider.dart';
import 'package:subrisu/providers/firebase_firestore_provider.dart';
import 'package:subrisu/providers/user_id_provider.dart';

part 'update_user_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentを更新するFutureProvider
@riverpod
Future<void> updateUser(Ref ref) async {
  final userId = ref.read(userIdProvider);

  // 端末のFCMトークンを取得
  final fcmToken = await ref.read(fcmTokenProvider.future);

  // 端末のタイムゾーン情報を取得
  final timezone = await ref.read(timezoneProvider.future);

  // UserDocumentのtokenを更新
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .update({
    FirestoreConstants.fcmTokenField: fcmToken,
    FirestoreConstants.timezoneField: timezone,
  });
}
