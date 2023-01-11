import '../constant/errors.dart' as errors;
import '../importer.dart';

class UserManager {
  final _auth = FirebaseAuth.instance;

  /// アプリの使用に必要なユーザーデータを取得する
  Future<void> getUserData(WidgetRef ref) async {
    final messaging = FirebaseMessaging.instance;
    final userRepository = ref.read(userViewModelProvider.notifier);
    final subscriptionRepository =
        ref.read(subscriptionViewModelProvider.notifier);

    // UserDocumentを取得
    await userRepository.getUser(_auth.currentUser!.uid);

    // SubscriptionStreamの取得を開始
    subscriptionRepository.getSubscriptions();

    // UserDocumentと端末のFCMTokenを取得
    final docToken = ref.read(userViewModelProvider).token;
    final deviceToken = await messaging.getToken();

    // Tokenが一致しない場合、端末のTokenでUserDocumentを更新
    if (docToken != deviceToken) {
      await userRepository.updateToken(deviceToken!);
    }

    // リスト画面のプログレスダイアログを閉じる
    ref.watch(isUserDataLoadedProvider.notifier).state = true;
  }

  /// Firebaseに匿名サインインを行い、ユーザーデータを作成する
  Future<void> anonymousSingnIn(WidgetRef ref) async {
    final userRepository = ref.read(userViewModelProvider.notifier);
    final subscriptionRepository =
        ref.read(subscriptionViewModelProvider.notifier);

    try {
      // 匿名サインインを実施
      final credential = await _auth.signInAnonymously();

      // 結果から匿名ユーザーIDを取得
      final userId = credential.user!.uid;

      // UserDocumentを作成
      // 匿名ユーザーIDをドキュメントIDとする
      await userRepository.create(userId);

      // SubscriptionStreamの取得を開始
      subscriptionRepository.getSubscriptions();

      // リスト画面のプログレスダイアログを閉じる
      ref.watch(isUserDataLoadedProvider.notifier).state = true;
    } on Exception catch (_) {
      throw errors.signInAnonymouslyErr;
    }
  }
}
