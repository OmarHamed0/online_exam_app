sealed class ForgetPasswordEvent{}
class ForgetPasswordButtonPressedEvent extends ForgetPasswordEvent {}
class ResetPasswordButtonPressedEvent extends ForgetPasswordEvent {}
class VerifyResetCodedButtonPressedEvent extends ForgetPasswordEvent {
  final String resetCode;
  VerifyResetCodedButtonPressedEvent({required this.resetCode});

}
class UpdateValidationEvent extends ForgetPasswordEvent{}