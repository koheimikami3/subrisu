import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/constants/firestore_constants.dart';
import 'package:subrisu/providers/firebase_firestore_provider.dart';
import 'package:subrisu/providers/user_id_provider.dart';

part 'subscriptions_collection_provider.g.dart';

/// ユーザーのSubscriptionsコレクション参照を提供するProvider
@riverpod
CollectionReference<Map<String, dynamic>> subscriptionsCollection(Ref ref) {
  final userId = ref.read(userIdProvider);
  return ref
      .read(firebaseFirestoreProvider)
      .collection(FirestoreConstants.usersCollection)
      .doc(userId)
      .collection(FirestoreConstants.subscriptionsCollection);
}
