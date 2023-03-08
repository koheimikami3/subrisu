import 'package:subrisu/importer.dart';

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel(this.repository, this.ref) : super(const UserState());

  final UserRepository repository;
  final Ref ref;

  /// ユーザーデータを取得する
  Future<void> getUser(String userId) async {
    try {
      // UserDocumentを取得
      final userDoc = await repository.getUser(userId);

      // stateを更新s
      final data = userDoc.data()! as Map<String, dynamic>;
      state = state.copyWith(
        userId: userDoc.id,
        token: data['token'] as String,
        os: data['os'] as String,
      );
    } on Exception {
      rethrow;
    }
  }

  /// ユーザーデータを作成する
  ///
  /// 認証IDをドキュメントIDに指定する
  Future<void> create(String userId) async {
    final messaging = FirebaseMessaging.instance;
    var os = '';

    // 端末のOSを取得
    if (Platform.isIOS) {
      os = 'iOS';
    } else if (Platform.isAndroid) {
      os = 'Android';
    }

    try {
      // 端末のFCMトークンを取得
      final token = await messaging.getToken();

      // UserDataを作成
      final data = UserData(
        userId: userId,
        os: os,
        token: token!,
      );

      // UserDocumentを作成
      await repository.create(data);

      // stateを更新
      state = state.copyWith(
        userId: data.userId,
        token: token,
        os: data.os,
      );
    } on Exception {
      rethrow;
    }
  }

  /// ユーザーデータのFCMトークンを更新する
  ///
  /// 非同期で処理を実行する
  void updateToken(String token) {
    repository.updateToken(state.userId, token);

    // stateを更新
    state = state.copyWith(token: token);
  }
}
