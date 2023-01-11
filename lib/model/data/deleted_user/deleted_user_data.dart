import 'package:subrisu/core/created_at_field.dart';
import 'package:subrisu/importer.dart';

part 'deleted_user_data.freezed.dart';
part 'deleted_user_data.g.dart';

@freezed
abstract class DeletedUserData implements _$DeletedUserData {
  const factory DeletedUserData({
    required String userId,
    required String os,
    @CreatedAtField() DateTime? deletedAt,
  }) = _DeletedUserData;

  const DeletedUserData._();

  factory DeletedUserData.fromJson(Map<String, dynamic> json) =>
      _$DeletedUserDataFromJson(json);
}
