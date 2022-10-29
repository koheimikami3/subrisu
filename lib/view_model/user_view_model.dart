import 'package:subrisu/importer.dart';

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel(this.repository) : super(const UserState());

  final UserRepository repository;

  Future<void> getUser(String userId) async {
    try {
      // UserDocumentを取得
      final userDoc = await repository.getUser(userId);

      // createdAtをTimestamp型からDateTime型に変換する
      final timestamp = userDoc.get('createdAt');
      final dateTime = timestamp.toDate();

      // stateを更新
      state = state.copyWith(
        userId: userDoc.id,
        os: userDoc.get('os'),
        createdAt: dateTime,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> create(String userId) async {
    late final String os;

    // 端末のOSを取得
    if (Platform.isIOS) os = 'iOS';
    if (Platform.isAndroid) os = 'Android';

    try {
      // UserDataを作成
      final data = UserData(
        userId: userId,
        os: os,
      );

      // UserDocumentを作成
      await repository.create(data);

      // stateを更新
      state = state.copyWith(
        userId: data.userId,
        os: data.os,
        createdAt: data.createdAt,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> delete() async {
    final userId = state.userId;

    try {
      // UserDocumentを削除
      await repository.delete(userId);
    } catch (_) {
      rethrow;
    }
  }
}
