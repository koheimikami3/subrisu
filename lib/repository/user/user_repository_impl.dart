import '../../importer.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  final _db = FirebaseFirestore.instance;

  /// UserDocumentを取得する
  @override
  Future<DocumentSnapshot> getUser(String userId) async {
    try {
      final doc = await _db.collection('users').doc(userId).get();
      return doc;
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// UserDocumentを作成する
  @override
  Future<void> create(UserData userData) async {
    try {
      await _db.collection('users').doc(userData.userId).set(userData.toJson());
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// UserDocumentのtokenを更新する
  ///
  /// 非同期で処理を実行する
  @override
  void updateToken(String userId, String token) {
    _db.collection('users').doc(userId).update({'token': token});
  }
}
