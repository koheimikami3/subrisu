import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_messaging_provider.g.dart';

/// FirebaseMessagingのインスタンスを提供するProvider
@riverpod
FirebaseMessaging firebaseMessaging(Ref ref) => FirebaseMessaging.instance;
