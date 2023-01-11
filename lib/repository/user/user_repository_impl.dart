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
    } on Exception catch (_) {
      throw errors.getUserErr;
    }
  }

  // UserDocumentを作成
  @override
  Future<void> create(UserData userData) async {
    try {
      await _db.collection('users').doc(userData.userId).set(userData.toJson());
    } on Exception catch (_) {
      throw errors.createUserErr;
    }
  }

  @override
  Future<void> updateToken(String userId, String token) async {
    try {
      await _db.collection('users').doc(userId).update({'token': token});
    } on Exception catch (_) {
      throw errors.createUserErr;
    }
  }
}
