import 'package:subrisu/core/created_at_field.dart';
import 'package:subrisu/importer.dart';

part 'delete_user_data.freezed.dart';
part 'delete_user_data.g.dart';

@freezed
abstract class DeleteUserData implements _$DeleteUserData {
  const DeleteUserData._();

  const factory DeleteUserData({
    required String userId,
    required String os,
    @CreatedAtField() DateTime? deletedAt,
  }) = _DeleteUserData;

  factory DeleteUserData.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserDataFromJson(json);
}
