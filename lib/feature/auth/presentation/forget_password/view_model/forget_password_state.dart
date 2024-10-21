part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoadingStata extends ForgetPasswordState{}
class UpdateValidationState extends ForgetPasswordState{}
class ForgetPasswordSuccessStata extends ForgetPasswordState{
  final String ? success;
  ForgetPasswordSuccessStata({required this.success});

}
class ForgetPasswordErrorStata extends ForgetPasswordState{
  final String ? errorMassage;
  ForgetPasswordErrorStata({required this.errorMassage});
}



class EmailVerifyCodeLoadingStata extends ForgetPasswordState{}
class EmailVerifyCodeSuccessStata extends ForgetPasswordState{
  final String ? success;
  EmailVerifyCodeSuccessStata({required this.success});

}
class EmailVerifyCodeErrorStata extends ForgetPasswordState{
  final String ? errorMassage;
  EmailVerifyCodeErrorStata({required this.errorMassage});
}



class ResetPasswordLoadingStata extends ForgetPasswordState{}
class ResetPasswordSuccessStata extends ForgetPasswordState{
  final User ? user;
  ResetPasswordSuccessStata({required this.user});

}
class ResetPasswordErrorStata extends ForgetPasswordState{
  final String ? errorMassage;
  ResetPasswordErrorStata({required this.errorMassage});
}