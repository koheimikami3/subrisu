import 'package:subrisu/gen/assets.gen.dart';
import 'package:subrisu/l10n/app_localizations.dart';

/// 設定画面の「作者の他のアプリ」に出すアプリ
///
/// 並び順がそのまま表示順(リリース順)。
enum AuthorApp {
  /// シンプル英単語帳
  eitangocho(appStoreId: '6794990348'),

  /// メトロノーム
  metronome(appStoreId: '6814060706');

  const AuthorApp({required this.appStoreId});

  /// App StoreのアプリID
  final String appStoreId;

  /// App StoreのURL
  ///
  /// 国コード(`/jp/`)を付けない。英語ユーザーを日本のストアに飛ばさないためで、
  /// 利用者の国のストアへは Apple 側でリダイレクトされる。
  String get appStoreUrl => 'https://apps.apple.com/app/id$appStoreId';

  /// アイコン
  ///
  /// ネットワークではなくアセットで持つ(オフラインや読み込み失敗で表示が崩れないように)。
  /// 実体は各アプリの AppIcon の縮小版。
  AssetGenImage get icon => switch (this) {
        AuthorApp.eitangocho => Assets.images.otherApps.eitangocho,
        AuthorApp.metronome => Assets.images.otherApps.metronome,
      };

  /// アプリ名
  String name(AppLocalizations l10n) => switch (this) {
        AuthorApp.eitangocho => l10n.eitangochoName,
        AuthorApp.metronome => l10n.metronomeName,
      };

  /// 1行説明(App Store の掲載名の ` - ` 以降に合わせる)
  String tagline(AppLocalizations l10n) => switch (this) {
        AuthorApp.eitangocho => l10n.eitangochoTagline,
        AuthorApp.metronome => l10n.metronomeTagline,
      };
}
