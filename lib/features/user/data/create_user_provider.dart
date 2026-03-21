import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/app_configs.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/enums/app_platform.dart';
import 'package:subrisu/features/user/data/fcm_token_provider.dart';
import 'package:subrisu/features/user/data/timezone_provider.dart';
import 'package:subrisu/features/user/domain/create_user_data.dart';
import 'package:subrisu/providers/firebase_firestore_provider.dart';

part 'create_user_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentを作成するFutureProvider
@riverpod
Future<void> createUser(Ref ref, String userId) async {
  late final String os;

  // 端末のOSを取得
  if (Platform.isIOS) {
    os = AppPlatform.iOS.name;
  } else if (Platform.isAndroid) {
    os = AppPlatform.android.name;
  }

  // 端末のFCMトークンを取得
  final fcmToken = await ref.read(fcmTokenProvider.future);

  // 端末のタイムゾーン情報を取得
  final timezone = await ref.read(timezoneProvider.future);

  // UserDocumentの作成データ
  final userData = CreateUserData(
    os: os,
    fcmToken: fcmToken,
    timezone: timezone,
    notifications: {
      FirestoreConstants.paymentReminderField: {
        FirestoreConstants.isEnabled: AppConfigs.defaultReminderIsEnabled,
        FirestoreConstants.daysBeforeField:
            AppConfigs.defaultReminderDaysBefore,
        FirestoreConstants.hourField: AppConfigs.defaultReminderHour,
      },
    },
  );

  // UserDocumentを作成
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .set(userData.toJson());
}
