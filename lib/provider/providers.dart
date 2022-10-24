import 'package:subrisu/importer.dart';

final userIdProvider = StateProvider((ref) => '');

final appVersionProvider = StateProvider((ref) => '');

final themeSettingProvider = StateProvider((ref) => 0);

final darkModeProvider = StateProvider((ref) => false);

final userViewModelProvider =
    Provider<UserViewModel>((ref) => UserViewModel(UserRepositoryImpl(), ref));
