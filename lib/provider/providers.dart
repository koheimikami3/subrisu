import 'package:subrisu/importer.dart';

final appVersionProvider = StateProvider((ref) => '');

final themeSettingProvider = StateProvider((ref) => 0);

final darkModeProvider = StateProvider((ref) => false);

final userViewModelProvider = StateNotifierProvider<UserViewModel, UserState>(
    (ref) => UserViewModel(UserRepositoryImpl()));
