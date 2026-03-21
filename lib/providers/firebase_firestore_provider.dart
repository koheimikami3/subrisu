import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_firestore_provider.g.dart';

/// FirebaseFirestoreのインスタンスを提供するProvider
@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) => FirebaseFirestore.instance;
