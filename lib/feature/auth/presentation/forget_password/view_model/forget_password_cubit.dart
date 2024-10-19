import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/api/api_result.dart';
import '../../../../../core/base/base_view_model.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/usecase/forget_password_use_case.dart';
import '../../../domain/usecase/reset_password_use_case.dart';
import '../../../domain/usecase/verify_reset_code_use_case.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_event.dart';
part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends BaseViewModel<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;

  ForgetPasswordCubit(this._forgetPasswordUseCase, this._resetPasswordUseCase,
      this._verifyResetCodeUseCase)
      : super(ForgetPasswordInitial());

  ///  controller
  final PageController pageController = PageController();
  var emailController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  /// Form

  var emailFormKey = GlobalKey<FormState>();
  var passwordFormKey = GlobalKey<FormState>();
  var confirmPasswordFormKey = GlobalKey<FormState>();

  Future<void> doAction(ForgetPasswordEvent forgetPasswordEvent) async {
    switch (forgetPasswordEvent) {
      case ForgetPasswordButtonPressedEvent():
        _forgetPassword();
      case ResetPasswordButtonPressedEvent():
        _resetPassword();
      case VerifyResetCodedButtonPressedEvent():
        _verifyResetCode(resetCode: forgetPasswordEvent.resetCode);
      case UpdateValidationEvent():
        _updateValidationState();
    }
  }

  void _forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingStata());
      var result =
          await _forgetPasswordUseCase.invoke(email: emailController.text);
      switch (result) {
        case Success<String?>():
          emit(ForgetPasswordSuccessStata(success: result.data));
        case Fail<String?>():
          emit(ForgetPasswordErrorStata(
              errorMassage: getErrorMassageFromException(result.exception)));
      }
    }
  }

  void _verifyResetCode({required String resetCode}) async {
    emit(EmailVerifyCodeLoadingStata());
    var result = await _verifyResetCodeUseCase.invoke(resetCode: resetCode);
    switch (result) {
      case Success<String?>():
        emit(EmailVerifyCodeSuccessStata(success: result.data));
      case Fail<String?>():
        emit(EmailVerifyCodeErrorStata(
            errorMassage: getErrorMassageFromException(result.exception)));
    }
  }

  void _resetPassword() async {
    emit(ResetPasswordLoadingStata());
    var result = await _resetPasswordUseCase.invoke(
        email: emailController.text, newPassword: newPasswordController.text);
    switch (result) {
      case Success<User?>():
        emit(ResetPasswordSuccessStata(user: result.data));
      case Fail<User?>():
        emit(ResetPasswordErrorStata(
            errorMassage: getErrorMassageFromException(result.exception)));
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValid = true;
  void _updateValidationState() {
    if (formKey.currentState!.validate()) {
      isValid = true;
    } else {
      isValid = false;
    }
    emit(UpdateValidationState());
  }
}
