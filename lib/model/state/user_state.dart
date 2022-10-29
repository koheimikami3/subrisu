import 'package:subrisu/importer.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState implements _$UserState {
  const UserState._();

  const factory UserState({
    @Default('') String userId,
    @Default('') String os,
    @Default(null) DateTime? createdAt,
  }) = _UserState;
}
