import 'package:subrisu/importer.dart';

final accountProvider = StateProvider((ref) => '');

final appVersionProvider = StateProvider((ref) => '');

final themeSettingProvider = StateProvider((ref) => 0);

final darkModeProvider = StateProvider((ref) => false);

final isUserDataLoadedProvider = StateProvider((ref) => false);

final serviceNameProvider = StateProvider.autoDispose((ref) => '');

final selectIconImagePathProvider = StateProvider.autoDispose((ref) => '');

final resultIconImagePathProvider = StateProvider.autoDispose((ref) => '');

final priceProvider = StateProvider.autoDispose((ref) => '');

final notificationProvider = StateProvider.autoDispose((ref) => false);

final userViewModelProvider = StateNotifierProvider<UserViewModel, UserState>(
    (ref) => UserViewModel(UserRepositoryImpl(), ref));

final subscriptionViewModelProvider =
    StateNotifierProvider<SubscriptionViewModel, List<QueryDocumentSnapshot>>(
        (ref) => SubscriptionViewModel(SubscriptionRepositoryImpl(), ref));

final deletedUserViewModelProvider = Provider<DeletedUserViewModel>(
    (ref) => DeletedUserViewModel(DeletedUserRepositoryImpl(), ref));
