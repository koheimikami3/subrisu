import '../../../importer.dart';

part 'create_user_provider.g.dart';

/// 指定されたユーザーIDでUserDocumentを作成するFutureProvider
@riverpod
Future<void> createUser(Ref ref, String userId) async {
  late final String os;

  // 端末のOSを取得
  if (Platform.isIOS) {
    os = 'iOS';
  } else if (Platform.isAndroid) {
    os = 'Android';
  }

  // 端末のFCMトークンを取得
  final token = await ref.read(firebaseMessagingProvider).getAPNSToken();

  // UserDocumentの作成データ
  final userData = CreateUserData(
    os: os,
    token: token!,
  );

  // UserDocumentを作成
  await ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .set(userData.toJson());
}
