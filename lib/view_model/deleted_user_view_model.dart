import 'package:subrisu/importer.dart';

class DeletedUserViewModel {
  DeletedUserViewModel(this.repository, this.ref);

  final DeletedUserRepository repository;
  final Ref ref;

  Future<void> create() async {
    final userId = ref.watch(userViewModelProvider).userId;
    final os = ref.watch(userViewModelProvider).os;

    try {
      // DeletedUserDataを作成
      final data = DeletedUserData(
        userId: userId,
        os: os,
      );

      // DeletedUserDocumentを作成
      // createdAtにUserDocumentのcreatedAtを使用
      await repository.create(data);

      ref.watch(isUserDataLoadedProvider.notifier).state = false;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
