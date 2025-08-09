import 'package:subrisu/importer.dart';

part 'create_user_data.freezed.dart';
part 'create_user_data.g.dart';

/// UserDocumentを作成するためのDTOクラス
@freezed
abstract class CreateUserData implements _$CreateUserData {
  const factory CreateUserData({
    // 端末のOS
    required String os,

    // FCMトークン
    required String fcmToken,

    // タイムゾーン
    required Map<String, dynamic> timezone,

    // 通知
    required Map<String, dynamic> notifications,

    // 作成日時
    @CreatedAtField() DateTime? createdAt,
  }) = _CreateUserData;

  const CreateUserData._();

  factory CreateUserData.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDataFromJson(json);
}
