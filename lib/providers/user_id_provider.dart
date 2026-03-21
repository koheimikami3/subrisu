import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:subrisu/features/user/data/firebase_auth_provider.dart';

part 'user_id_provider.g.dart';

/// FirebaseAuthのCurrentUserIdを提供するProvider
@riverpod
String userId(Ref ref) => ref.read(firebaseAuthProvider).currentUser!.uid;
