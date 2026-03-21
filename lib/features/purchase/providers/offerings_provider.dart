import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offerings_provider.g.dart';

/// RevenueCatのOfferingsを提供するFutureProvider
@riverpod
Future<Offerings> offerings(Ref ref) => Purchases.getOfferings();
