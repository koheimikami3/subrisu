import 'package:subrisu/importer.dart';

abstract class UserRepository {
  Future<void> create(UserData data);

  Future<void> delete(String userId);
}
