import 'package:subrisu/importer.dart';

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel(this.repository, this.ref) : super(const UserState());

  final UserRepository repository;
  final Ref ref;

  Future<DocumentSnapshot?> getUser(String userId) async {
    try {
      // UserDocumentを取得
      final userDoc = await repository.getUser(userId);

      // Documentが存在しない場合、NULLを返す
      if (!userDoc.exists) return null;

      // stateを更新
      state = state.copyWith(
        userId: userDoc.id,
        os: userDoc.get('os'),
      );

      ref.watch(isUserDataLoadedProvider.notifier).state = true;

      return userDoc;
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
      );

      ref.watch(isUserDataLoadedProvider.notifier).state = true;
    } catch (_) {
      rethrow;
    }
  }
}
