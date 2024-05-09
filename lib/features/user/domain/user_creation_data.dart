import 'package:subrisu/importer.dart';

part 'user_creation_data.freezed.dart';
part 'user_creation_data.g.dart';

/// UserDocumentの作成データ
@freezed
abstract class UserCreationData implements _$UserCreationData {
  const factory UserCreationData({
    // 端末のOS
    required String os,

    // FCMトークン
    required String token,

    // 作成日時
    @CreatedAtField() DateTime? createdAt,
  }) = _UserCreationData;

  const UserCreationData._();

  factory UserCreationData.fromJson(Map<String, dynamic> json) =>
      _$UserCreationDataFromJson(json);
}
