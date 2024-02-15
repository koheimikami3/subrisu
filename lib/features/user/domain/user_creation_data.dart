import 'package:subrisu/importer.dart';

part 'user_creation_data.freezed.dart';
part 'user_creation_data.g.dart';

/// UserDocumentの作成データ
@freezed
abstract class UserCreationData implements _$UserCreationData {
  const factory UserCreationData({
    required String os,
    required String token,
    @CreatedAtField() DateTime? createdAt,
  }) = _UserCreationData;

  const UserCreationData._();

  factory UserCreationData.fromJson(Map<String, dynamic> json) =>
      _$UserCreationDataFromJson(json);
}
