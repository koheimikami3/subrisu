import 'package:subrisu/importer.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  final _db = FirebaseFirestore.instance;

  // UserDocumentを作成
  @override
  Future<void> create(UserData userData) async {
    try {
      await _db.collection('users').doc(userData.userId).set({
        'userId': userData.userId,
        'createdAt': FieldValue.serverTimestamp(),
      });
      // ignore: empty_catches
    } catch (_) {}
  }

  // UserDocumentを削除
  @override
  Future<void> delete(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
      // ignore: empty_catches
    } catch (_) {}
  }
}
