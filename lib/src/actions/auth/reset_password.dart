part of auth_actions;

@freezed
abstract class ResetPassword with _$ResetPassword implements AppAction {
  const factory ResetPassword({@required String email}) = ResetPassword$;

  const factory ResetPassword.successful() = ResetPasswordSuccessful;

  @Implements(ErrorAction)
  const factory ResetPassword.error(Object error) = ResetPasswordError;
}
