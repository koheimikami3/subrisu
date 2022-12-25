import 'package:subrisu/core/created_at_field.dart';
import 'package:subrisu/importer.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
abstract class UserData implements _$UserData {
  const UserData._();

  const factory UserData({
    @Default('') String userId,
    required String os,
    required String token,
    @CreatedAtField() DateTime? createdAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
