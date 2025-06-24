import '../../../importer.dart';

part 'offerings_provider.g.dart';

/// RevenueCatのOfferingsを提供するFutureProvider
@riverpod
Future<Offerings> offerings(Ref ref) => Purchases.getOfferings();
