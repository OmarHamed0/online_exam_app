part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LoginLoadingStata extends LoginState {}
class LoginSuccessStata extends LoginState {
  final User ? user;
  LoginSuccessStata({ this.user});
}
class LoginErrorStata extends LoginState {
  final String ? errorMassage;
  LoginErrorStata({ this.errorMassage});
}


class RememberMeButtonState extends LoginState {}
class UpdateValidationState extends LoginState {}
