import 'package:flutter/material.dart';
import '../../../../../core/api/api_result.dart';
import '../../../../../core/base/base_view_model.dart';
import '../../../../../core/caching/token_manger.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/usecase/login_use_case.dart';
import 'package:injectable/injectable.dart';

import 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends BaseViewModel<LoginState> {
 final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(LoginInitial());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  Future<void>doAction(LoginEvent loginEven)async{
    switch (loginEven) {
      case LoginButtonPressedEvent(): await _login();
      case RememberMeButtonEvent():_changeRememberMe();
      case UpdateValidationEvent():_updateValidationState();
    }
  }

  Future<void> _login() async {
    if(formKey.currentState!.validate()){
      emit(LoginLoadingStata());
      var result =
      await _loginUseCase.invoke(email: email.text, password: password.text);
      switch (result) {
        case Success<User?>():
          if(isRememberMe){
             TokenManger.setToken(token:result.data?.token ?? "");
          }
          emit(LoginSuccessStata(user: result.data));

        case Fail<User?>():
          emit(LoginErrorStata(errorMassage:getErrorMassageFromException(result.exception)));
      }
    }

  }

 bool isRememberMe=false;
  void _changeRememberMe(){
    isRememberMe =! isRememberMe;
    emit(RememberMeButtonState());
  }

  bool isValid=false;
  void _updateValidationState(){
    if(formKey.currentState!.validate()){
      isValid=true;
    }else{
      isValid =false;
    }
    emit(UpdateValidationState());
  }
}
