# CLAUDE.md

このファイルはClaude Code (claude.ai/code) がこのリポジトリで作業する際のガイドラインです。

## 応答言語

ユーザーへの応答は日本語で行うこと。コード内のコメントも日本語で記述する。

## プロジェクト概要

Subrisuはサブスクリプション管理のFlutter/Dart製iOSアプリ。バックエンドにFirebase（Auth, Firestore, Remote Config, Crashlytics, Messaging, Analytics）、アプリ内課金にRevenueCat、バナー広告にGoogle Mobile Adsを使用。日本語・英語の多言語対応。

## ビルド・開発コマンド

```bash
# コード生成（freezed, riverpod_generator, json_serializable, envied, flutter_gen）
dart run build_runner build --delete-conflicting-outputs

# 変更監視しながらコード生成
dart run build_runner watch --delete-conflicting-outputs

# テスト実行
flutter test

# 単一テストファイルの実行
flutter test test/widget_test.dart

# 静的解析
flutter analyze

# ローカライズファイル生成
flutter gen-l10n

# スプラッシュスクリーン生成
dart run flutter_native_splash:create
```

## アーキテクチャ

### 状態管理・DI
- **Riverpod** コード生成方式（`@riverpod`アノテーション → `.g.dart`ファイル）
- **Freezed** で不変データクラスを定義（`@freezed` → `.freezed.dart`ファイル）
- グローバルなProviderは`lib/providers/`に配置、機能固有のProviderは各feature内に配置

### 機能ベースのディレクトリ構成（`lib/features/`）
各機能は以下のレイヤーパターンに従う：
- `data/` — Firebase等の外部サービスと連携するRiverpod Provider
- `domain/` — Freezedモデルクラス
- `presentation/` — ページ、ページボディ、`widgets/`サブディレクトリ

主な機能：`subscription`（サブスクのCRUD）、`user`（匿名認証、FCMトークン）、`notification_settings`（支払いリマインダー）、`purchase`（RevenueCatアプリ内課金）、`settings`、`currency_settings`、`language_settings`、`theme_settings`

### バレルインポート
全インポートは`lib/importer.dart`に集約。各ファイルは個別パッケージではなくこの1ファイルをインポートする。

### 環境変数
`envied`パッケージで管理。シークレット（広告ID、RevenueCatキー）はプロジェクトルートの`.env`ファイルに定義し、`lib/env/env.dart`経由でアクセス。生成コードは`env.g.dart`。

### データ層
- Firebase匿名認証 — ユーザーはFirebase UIDで識別
- Firestoreにユーザードキュメントとサブスクリプションのサブコレクションを保存
- Subscriptionモデルは独自の`fromFirestore`/`toFirestore`を使用（汎用JSONシリアライズではない）

### ローカライズ
- ARBファイルは`lib/l10n/`に配置（テンプレート：`app_en.arb`、翻訳：`app_ja.arb`）
- `AppLocalizations`（`flutter_gen/gen_l10n/`）経由でアクセス

### アプリアイコン
`ios/Runner/AppIcon.icon`（Icon Composer 形式）が正基準。Icon Composer で開いて編集する。`icon.json` の `layers` は先頭が最前面。同名の appiconset は置かない（`.icon` が優先され、iOS 25 以前向けの絵も `.icon` から Xcode が生成するため）。

### コード生成
生成ファイル（`*.g.dart`、`*.freezed.dart`、`assets.gen.dart`）はリポジトリにコミット済み。`@riverpod`、`@freezed`、`@Envied`アノテーションを変更した後は`build_runner`を再実行すること。

### コーディング規約
- if文のbodyはワンライナーにせず、必ずブロック`{}`で囲む

### リント
`pedantic_mono`をベースの解析ルールセットとして使用（`analysis_options.yaml`参照）。
