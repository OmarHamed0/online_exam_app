import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base/base_view_model.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/reset_password/reset_password_event.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../data/mdoel/request/change_password_request.dart';
import '../../../../domain/entities/change_password_entity.dart';
import '../../../../domain/use_case/profile/change_password_use_case.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends BaseViewModel<ResetPasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  ResetPasswordCubit(this._changePasswordUseCase)
      : super(ResetPasswordInitial());

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void doAction(ResetPasswordEvent resetPasswordEvent) {
    switch (resetPasswordEvent) {
      case GetResetPasswordEvent():
        _resetPassword();
    }
  }

  Future<void> _resetPassword() async {
    emit(ResetPasswordLoadingState());
    var result = await _changePasswordUseCase.invoke(ChangePasswordRequest(
        oldPassword.text, password.text, rePassword.text));
    switch (result) {
      case Success<ChangePasswordEntity>():
        emit(ResetPasswordSuccessState(changePasswordEntity: result.data));
      case Fail<ChangePasswordEntity>():
        emit(ResetPasswordErrorState(
            errorHandler: getErrorMassageFromException(result.exception)));
    }
  }
}
