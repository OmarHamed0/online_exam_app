part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState{}
class ResetPasswordSuccessState extends ResetPasswordState{
 final ChangePasswordEntity  ? changePasswordEntity;
  ResetPasswordSuccessState({ this.changePasswordEntity});

}
class ResetPasswordErrorState extends ResetPasswordState{
  final String? errorHandler;
  ResetPasswordErrorState({ this.errorHandler});
}
