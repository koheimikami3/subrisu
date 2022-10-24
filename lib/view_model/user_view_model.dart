import 'package:subrisu/importer.dart';

class UserViewModel {
  UserViewModel(this.repository, this.ref);

  final UserRepository repository;
  final Ref ref;

  Future<void> create(String userId) async {
    try {
      // UserDataを作成
      final data = UserData(
        userId: userId,
      );

      // UserDocumentを作成
      await repository.create(data);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> delete(String userId) async {
    try {
      // UserDocumentを削除
      await repository.delete(userId);
    } catch (_) {
      rethrow;
    }
  }
}
