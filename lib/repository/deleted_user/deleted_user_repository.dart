import 'package:subrisu/importer.dart';

abstract class DeletedUserRepository {
  Future<void> create(DeletedUserData data);
}
