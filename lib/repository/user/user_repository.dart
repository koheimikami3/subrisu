import 'package:subrisu/importer.dart';

abstract class UserRepository {
  Future<DocumentSnapshot> getUser(String userId);

  Future<void> create(UserData data);
}
