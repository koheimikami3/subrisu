import 'package:subrisu/importer.dart';

final loginErrorProvider = StateProvider((ref) => false);

final isUserLoadedProvider = StateProvider((ref) => false);

final isPurchasedProvider = StateProvider((ref) => false);

final themeProvider = StateProvider((ref) => 0);

final darkModeProvider = StateProvider((ref) => false);

final listSortProvider = StateProvider((ref) => 0);

final serviceNameProvider = StateProvider.autoDispose((ref) => '');

final selectIconImagePathProvider = StateProvider.autoDispose((ref) => '');

final resultIconImagePathProvider = StateProvider.autoDispose((ref) => '');

final priceProvider = StateProvider.autoDispose((ref) => '');

final paymentCycleProvider = StateProvider.autoDispose((ref) => 2);

final firstPaidOnProvider = StateProvider.autoDispose((ref) => DateTime.now());

final firstPaidYearProvider =
    StateProvider.autoDispose((ref) => DateTime.now().year);

final firstPaidMonthProvider =
    StateProvider.autoDispose((ref) => DateTime.now().month);

final firstPaidDayProvider =
    StateProvider.autoDispose((ref) => DateTime.now().day);

final notificationProvider = StateProvider.autoDispose((ref) => false);

final memoProvider = StateProvider.autoDispose((ref) => '');

final userViewModelProvider = StateNotifierProvider<UserViewModel, UserState>(
  (ref) => UserViewModel(UserRepositoryImpl(), ref),
);

final subscriptionViewModelProvider =
    StateNotifierProvider<SubscriptionViewModel, List<QueryDocumentSnapshot>>(
  (ref) => SubscriptionViewModel(SubscriptionRepositoryImpl(), ref),
);
