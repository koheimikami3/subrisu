# リリース設定

`/release` スキル(`~/.claude/skills/release/`)が読む、このアプリ固有の値。
手順そのものはスキル側にあり、ここにはサブリスだけの規則を書く。

## プラットフォーム

- iOS(App Store)のみ

## バージョンとビルド番号

- `pubspec.yaml` の `version:` を `<version>+1` にする
- `ios/Runner.xcodeproj/project.pbxproj` の `MARKETING_VERSION`(3 か所)も同じバージョンに
  揃える。実際の表示は Info.plist の `$(FLUTTER_BUILD_NAME)` で決まるが、Xcode の
  General 画面の表示と食い違わないように合わせている
- バンプのコミット: `chore: bump version to <version>`(pubspec と pbxproj を 1 コミットで)
- **ビルド番号は毎回 `1`**。同じバージョン内で番号がぶつかったときは Xcode がアップロード時に
  自動で繰り上げるので、台帳は持たない([release-notes.md](release-notes.md) の見出しも
  `## <version>` だけ)

## 完了時の検証

```
flutter analyze
flutter test
```

## リリースノート

- 日本語の文面だけを控える(App Store のバージョン履歴に出る文面)
- 見出しの下に `公開日: <yyyy/mm/dd>` を書く。提出時点では公開日が分からないので
  `公開日: 審査中` とし、公開の報告を受けたら日付に直す(スキルの 8 と同じ流れで確認をとる)

## Archive 前の手順

```
flutter build ios --config-only
```

## タグ

- v2.8.0 以降は注釈付き(スキルの 7 の書式)
- v2.7.0 以前は、2026/09/23 に App Store の公開日時から推定して後付けした注釈なしタグ。
  書式を揃えるときの手本には使わない(手本は v2.8.0 以降)
