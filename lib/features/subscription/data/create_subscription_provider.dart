import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/features/subscription/domain/subscription_data/subscription_data.dart';
import 'package:subrisu/features/subscription/presentation/subscription_form_provider.dart';
import 'package:subrisu/gen/assets.gen.dart';
import 'package:subrisu/providers/subscriptions_collection_provider.dart';

part 'create_subscription_provider.g.dart';

/// ユーザーのSubscriptionDocumentを作成するFutureProvider
@riverpod
Future<void> createSubscription(Ref ref) async {
  final formState = ref.read(subscriptionFormNotifierProvider);
  final note = formState.note.isEmpty ? null : formState.note;

  // アイコン画像が未設定の場合、サブリスアイコンを使用
  final iconImagePath = formState.resultIconImagePath.isEmpty
      ? Assets.images.subscription.subrisu.path
      : formState.resultIconImagePath;

  // SubscriptionDocumentの作成データ
  final subscriptionData = SubscriptionData(
    serviceName: formState.serviceName,
    price: num.parse(formState.price),
    iconImagePath: iconImagePath,
    paymentCycle: formState.paymentCycle.name,
    firstPaidOn: formState.resultFirstPaidDate,
    note: note,
  );

  // SubscriptionDocumentを作成するためのJSONデータ
  // createdAtフィールドはサーバータイムスタンプを使用
  final json = subscriptionData.toJson();
  json[FirestoreConstants.createdAtField] = FieldValue.serverTimestamp();

  // SubscriptionDocumentを作成
  await ref.read(subscriptionsCollectionProvider).add(json);
}
