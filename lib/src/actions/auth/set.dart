part of auth_actions;

@freezed
abstract class UpdateRegisterInfo with _$UpdateRegisterInfo implements AppAction {
  const factory UpdateRegisterInfo({
    String email,
    String displayName,
    String password,
  }) = UpdateRegisterInfo$;
}
