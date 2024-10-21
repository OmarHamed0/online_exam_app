import 'package:flutter/cupertino.dart';
import 'package:online_exam/feature/auth/presentation/register/view_model/register/register_event.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../core/base/base_view_model.dart';
import '../../../../domain/entity/user.dart';
import '../../../../domain/usecase/register_use_case.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends BaseViewModel<RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> doAction(RegisterEvent registerEvent) async {
    switch (registerEvent) {
      case RegisterButtonPressedEvent():
        await _register();
      case UpdateValidationEvent():
        _updateValidationState();
    }
  }

  Future<void> _register() async {
    if(formKey.currentState!.validate()){
    emit(RegisterLoadingStata());
    var result = await _registerUseCase.invoke(
        userNameController.text,
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    switch (result) {
      case Success<User?>():
        emit(RegisterSuccessStata(user: result.data));
      case Fail<User?>():
        emit(RegisterErrorStata(
            errorMassage: getErrorMassageFromException(result.exception)));
    }}
  }

  bool isValid = false;
  void _updateValidationState() {
    if (formKey.currentState!.validate()) {
      isValid = true;
    } else {
      isValid = false;
    }
    emit(UpdateValidationState());
  }
}
