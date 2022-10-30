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
  Future<void> delete(DeleteUserData data) async {
    final batch = _db.batch();

    try {
      final user = await _db.collection('users').doc(data.userId).get();
      final subscriptions = await _db
          .collection('users')
          .doc(data.userId)
          .collection('subscriptions')
          .get();
      final deleteUser = await _db.collection('deleteUsers').doc().get();

      // UserDocumentを削除
      batch.delete(user.reference);

      // SubscriptionDocumentを全て削除
      for (var doc in subscriptions.docs) {
        batch.delete(doc.reference);
      }

      // DeleteUserDocumentを作成
      // UserDocumentのcreatedAtを追加
      batch.set(deleteUser.reference, data.toJson());
      batch.set(
        deleteUser.reference,
        {'createdAt': user.get('createdAt')},
        SetOptions(merge: true),
      );

      await batch.commit();
    } catch (_) {
      throw errors.deleteUserErr;
    }
  }
}
