import 'package:subrisu/importer.dart';

final accountProvider = StateProvider((ref) => '');

final appVersionProvider = StateProvider((ref) => '');

final themeSettingProvider = StateProvider((ref) => 0);

final darkModeProvider = StateProvider((ref) => false);

final isUserDataLoadedProvider = StateProvider((ref) => false);

final userViewModelProvider = StateNotifierProvider<UserViewModel, UserState>(
    (ref) => UserViewModel(UserRepositoryImpl(), ref));

final deletedUserViewModelProvider = Provider<DeletedUserViewModel>(
    (ref) => DeletedUserViewModel(DeletedUserRepositoryImpl(), ref));
