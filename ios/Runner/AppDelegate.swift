import UIKit
import Flutter
// Swift Package Managerには`Firebase`アンブレラモジュールが無いため、個別のモジュールを読み込む
import FirebaseAppCheck

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // AppCheckのデバッグトークンをXcodeのコンソールに表示するために必要
    // デバッグしたい端末が新たに出てきた場合使用する
#if DEBUG
    let providerFactory = AppCheckDebugProviderFactory()
    AppCheck.setAppCheckProviderFactory(providerFactory)
#endif

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // UISceneライフサイクルではAppDelegateではなくこちらでプラグインを登録する
  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}
