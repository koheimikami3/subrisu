import 'package:subrisu/importer.dart';
import '../../constant/errors.dart' as errors;

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  final _db = FirebaseFirestore.instance;

  // UserDocumentを取得
  @override
  Future<DocumentSnapshot> getUser(String userId) async {
    try {
      final doc = await _db.collection('users').doc(userId).get();
      return doc;
    } catch (_) {
      throw errors.getUserErr;
    }
  }

  // UserDocumentを作成
  @override
  Future<void> create(UserData userData) async {
    try {
      await _db.collection('users').doc(userData.userId).set(userData.toJson());
    } catch (_) {
      throw errors.createUserErr;
    }
  }

  // UserDocumentを削除
  @override
  Future<void> delete(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
    } catch (_) {
      throw errors.deleteUserErr;
    }
  }
}
