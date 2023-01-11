import 'package:subrisu/importer.dart';

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel(this.repository, this.ref) : super(const UserState());

  final UserRepository repository;
  final Ref ref;

  Future<void> getUser(String userId) async {
    try {
      // UserDocumentを取得
      final userDoc = await repository.getUser(userId);

      // stateを更新
      final data = userDoc.data()! as Map;
      state = state.copyWith(
        userId: userDoc.id,
        token: data['token'] as String,
        os: data['os'] as String,
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> create(String userId) async {
    final messaging = FirebaseMessaging.instance;
    late final String os;

    // 端末のOSを取得
    if (Platform.isIOS) {
      os = 'iOS';
    } else {
      os = 'Android';
    }

    // 端末のFCMトークンを取得
    final token = await messaging.getToken();

    try {
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
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> updateToken(String token) async {
    try {
      await repository.updateToken(state.userId, token);

      // stateを更新
      state = state.copyWith(token: token);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
