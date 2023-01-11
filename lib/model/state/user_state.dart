import 'package:subrisu/importer.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState implements _$UserState {
  const factory UserState({
    @Default('') String userId,
    @Default('') String token,
    @Default('') String os,
  }) = _UserState;

  const UserState._();
}
