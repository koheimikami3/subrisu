import 'package:subrisu/importer.dart';

part 'user_data.freezed.dart';

@freezed
abstract class UserData implements _$UserData {
  const UserData._();

  const factory UserData({
    @Default('') String userId,
  }) = _UserData;
}
