import 'package:subrisu/importer.dart';
import '../../constant/errors.dart' as errors;

class DeletedUserRepositoryImpl implements DeletedUserRepository {
  DeletedUserRepositoryImpl();

  final _db = FirebaseFirestore.instance;

  // DeletedUserDocumentを作成
  // createdAtにUserDocumentのcreatedAtを使用
  @override
  Future<void> create(DeletedUserData data) async {
    final batch = _db.batch();

    try {
      final user = await _db.collection('users').doc(data.userId).get();
      final deleteUser = await _db.collection('deletedUsers').doc().get();

      batch.set(deleteUser.reference, data.toJson());
      batch.set(
        deleteUser.reference,
        {'createdAt': user.get('createdAt')},
        SetOptions(merge: true),
      );

      await batch.commit();
    } on Exception catch (_) {
      throw errors.deleteUserErr;
    }
  }
}
