import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_provider.g.dart';

/// FirebaseAuthのインスタンスを提供するProvider
@riverpod
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;
